library(dplyr)

d <- prep_table(where = "locally")
d <- d |> select(-mod_multispecies, -mod_mechanistic, -manuscript_doi)

pal <- RColorBrewer::brewer.pal(8, "Set1") |> rev()
pal[3] <- RColorBrewer::brewer.pal(6, "Dark2")[6]

pdf("fig3.pdf", height = 7, width = 16)
f2a <- plot_dendrogram(d, k=8, cex = 0.7, diff_method = "binary", k_colors = pal, horiz = TRUE, main = "")
f2b <- plot_dendrogram(d, k=8, cex = 1, diff_method = "binary", type = "phylogenic", repel = TRUE, k_colors = pal)
gridExtra::grid.arrange(f2a, f2b, nrow = 1, widths = c(10, 6))
dev.off()

clust <- plot_dendrogram(d, k=8, cex = 0.7, diff_method = "binary", k_colors = pal, horiz = TRUE, main = "", return_clust = TRUE)
pkgOrder <- rev(clust$labels[clust$order])
# dend <- as.dendrogram(clust)
# dend <- dendextend::set(dend, "branches_k_color", k = 8, value = pal) |> dendextend::set("labels_col", k = 8, value = pal)

png("fig3.png", height = 480, width = 1100)
gridExtra::grid.arrange(f2a, f2b, nrow = 1, widths = c(10, 6))
dev.off()

pkgCols <- pkgOrder
names(pkgCols) <- pkgOrder
pkgCols[1:4] <- pal[8]
pkgCols[5] <- pal[7]
pkgCols[6:7] <- pal[6]
pkgCols[8:27] <- pal[5]
pkgCols[28] <- pal[4]
pkgCols[29:31] <- pal[3]
pkgCols[32:34] <- pal[2]
pkgCols[35] <- pal[1]

pdf("fig2.pdf", height = 10, width = 10)
plot_table(d, pkgOrder = pkgOrder, pkgCols = pkgCols, removeEmptyCats = TRUE)
dev.off()

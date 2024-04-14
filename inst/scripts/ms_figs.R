library(dplyr)

d <- prep_table(where = "core")
# d <- d |> select(-mod_multispecies, -mod_mechanistic)

pal <- RColorBrewer::brewer.pal(8, "Set1") |> rev()
pal[3] <- RColorBrewer::brewer.pal(6, "Dark2")[6]

pdf("fig3.pdf", height = 7, width = 16)
f2a <- plot_dendrogram(d, k = 8, cex = 0.7, diff_method = "binary",
                       k_colors = pal, horiz = TRUE, main = "")
f2b <- plot_dendrogram(d, k = 8, cex = 1, diff_method = "binary",
                       type = "phylogenic", repel = TRUE, k_colors = pal)
gridExtra::grid.arrange(f2a, f2b, nrow = 1, widths = c(10, 6))
dev.off() #nolint

clust <- plot_dendrogram(d, k = 8, cex = 0.7, diff_method = "binary",
                         k_colors = pal, horiz = TRUE, main = "",
                         return_clust = TRUE)
pkg_order <- rev(clust$labels[clust$order])

png("fig3.png", height = 480, width = 1100)
gridExtra::grid.arrange(f2a, f2b, nrow = 1, widths = c(10, 6))
dev.off() #nolint

pkg_cols <- pkg_order
names(pkg_cols) <- pkg_order
pkg_cols[1:4] <- pal[8]
pkg_cols[5] <- pal[7]
pkg_cols[6:7] <- pal[6]
pkg_cols[8:27] <- pal[5]
pkg_cols[28] <- pal[4]
pkg_cols[29:31] <- pal[3]
pkg_cols[32:34] <- pal[2]
pkg_cols[35] <- pal[1]

g <- plot_table(d,
           pkg_order = pkg_order,
           remove_empty_cats = TRUE)
ggplot2::ggsave("inst/img/pkgs.png", g, height = 10, width = 10)

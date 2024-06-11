library(dplyr)

d.orig <- prep_table(where = "online")

d.orig <- filter(d.orig, name != "rgbif",
                 name != "ibis.iSDM",
                 name != "dismo") |>
          select(-mod_mechanistic,
                 -mod_multispecies)

pal <- RColorBrewer::brewer.pal(n = 5, name = "Dark2")

pdf("fig3.pdf", height = 5, width = 9.7)
plot_dendrogram(d.orig, k = 5, cex = 0.7, diff_method = "binary",
                k_colors = pal, horiz = TRUE, main = "")
dev.off()

clust <- plot_dendrogram(d.orig, k = 5, cex = 1, diff_method = "binary",
                         k_colors = pal, horiz = TRUE, main = "",
                         return_clust = TRUE)
pkg_order <- rev(clust$labels[clust$order])

pkg_cols <- pkg_order
names(pkg_cols) <- pkg_order

pkg_cols[1:21] <- pal[5]
pkg_cols[22:26] <- pal[4]
pkg_cols[27:30] <- pal[3]
pkg_cols[31] <- pal[2]
pkg_cols[32:33] <- pal[1]

pdf("fig2.pdf", height = 7, width = 16)
plot_table(d.orig,
           pkg_order = pkg_order,
           pkg_cols = pkg_cols,
           remove_empty_cats = TRUE)
dev.off()

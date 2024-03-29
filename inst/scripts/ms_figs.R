library(sdmverse)

d <- prep_table(where = "locally")

png("fig2.png", height = 480, width = 800)
plot_table(d)
dev.off()

pdf("fig3.pdf", height = 7, width = 16)
f2a <- plot_dendrogram(d,
  k = 6, cex = 0.7, diff_method = "binary",
  k_colors = RColorBrewer::brewer.pal(9, "Set1")
  [c(1, 2, 8, 4, 5, 3)], horiz = TRUE, main = ""
)
f2b <- plot_dendrogram(d,
  k = 6, cex = 1, diff_method = "binary",
  type = "phylogenic", repel = TRUE,
  k_colors = RColorBrewer::brewer.pal(9, "Set1")
  [c(1, 2, 8, 4, 5, 3)]
)
gridExtra::grid.arrange(f2a, f2b, nrow = 1, widths = c(10, 6))
dev.off()

png("fig3.png", height = 480, width = 1100)
gridExtra::grid.arrange(f2a, f2b, nrow = 1, widths = c(10, 6))
dev.off()

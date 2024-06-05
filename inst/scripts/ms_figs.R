library(dplyr)

d.orig <- prep_table(where = "online")
d <- d.orig
d$env_process <- ifelse(d$env_collinearity == TRUE, TRUE, d$env_process)
d$study_region <- ifelse(d$backg_sample == TRUE, TRUE, d$study_region)
d$pred_inspect <- ifelse(d$pred_extrapolation == TRUE, TRUE, d$pred_inspect)
d$mod_combine <- d$mod_ensemble
d$mod_combine <- ifelse(d$mod_stack == TRUE, TRUE, d$mod_combine)
d <- select(d, -data_integration, -env_collinearity, -backg_sample,
            -pred_extrapolation, -mod_multispecies, -mod_mechanistic,
            -mod_stack, -mod_ensemble, -pred_general, -mod_fit) |>
  filter(name != "rgbif", name != "ibis.iSDM", name != "dismo")
d.orig <- filter(d.orig, name != "rgbif", name != "ibis.iSDM", name != "dismo")

library(pals)
pal <- c("#1b9e77", "#d95f02", "#7570b3", "#e7298a", "#66a61e", "#e6ab02")

pdf("fig3.pdf", height = 7, width = 10.5)
plot_dendrogram(d, k = 6, cex = 0.8, diff_method = "binary",
                k_colors = pal, horiz = TRUE, main = "")
dev.off() #nolint

clust <- plot_dendrogram(d, k = 6, cex = 1, diff_method = "binary",
                         k_colors = pal, horiz = TRUE, main = "",
                         return_clust = TRUE)
pkg_order <- rev(clust$labels[clust$order])

pkg_cols <- pkg_order
names(pkg_cols) <- pkg_order
pkg_cols[1:6] <- pal[6]
pkg_cols[7:26] <- pal[5]
pkg_cols[27:30] <- pal[4]
pkg_cols[31] <- pal[3]
pkg_cols[32] <- pal[2]
pkg_cols[33] <- pal[1]

pdf("fig2.pdf", height = 7, width = 16)
plot_table(d.orig,
           pkg_order = pkg_order,
           pkg_cols = pkg_cols,
           remove_empty_cats = TRUE)
dev.off()

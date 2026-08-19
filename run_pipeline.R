# ============================================================
# IPK_Twin3_Barley_Phenomics
# Main Pipeline Runner
# ============================================================

cat("\n")
cat("====================================================\n")
cat(" IPK Twin-3: Barley Phenomics and Genomics Pipeline\n")
cat("====================================================\n\n")

# ------------------------------------------------------------
# Create required directories
# ------------------------------------------------------------

directories <- c(
  "data/raw",
  "data/processed",
  "data/genomic",
  "data/phenomic",
  "data/metadata",
  "output/figures",
  "output/models",
  "output/tables",
  "output/reports",
  "docs"
)

for (dir in directories) {
  
  if (!dir.exists(dir)) {
    dir.create(
      dir,
      recursive = TRUE,
      showWarnings = FALSE
    )
  }
}

cat("✓ Project directories checked.\n\n")


# ------------------------------------------------------------
# Define pipeline scripts
# ------------------------------------------------------------

pipeline_scripts <- c(
  
  "R/00_install_packages.R",
  
  "R/01_simulate_data.R",
  
  "R/02_seed_phenomics.R",
  
  "R/03_multispectral_analysis.R",
  
  "R/04_genomic_analysis.R",
  
  "R/05_data_integration.R",
  
  "R/06_machine_learning.R",
  
  "R/07_digital_twin.R",
  
  "R/08_genebank_decision_support.R",
  
  "R/09_visualization_report.R"
  
)


# ------------------------------------------------------------
# Run pipeline
# ------------------------------------------------------------

for (script in pipeline_scripts) {
  
  cat("----------------------------------------------------\n")
  cat("Running:", script, "\n")
  cat("----------------------------------------------------\n")
  
  if (!file.exists(script)) {
    
    warning(
      paste(
        "Script not found:",
        script
      )
    )
    
    next
  }
  
  tryCatch(
    
    {
      
      source(
        script,
        local = FALSE
      )
      
      cat("✓ Completed successfully:", script, "\n\n")
      
    },
    
    error = function(e) {
      
      cat(
        "✗ ERROR in:",
        script,
        "\n"
      )
      
      cat(
        "Message:",
        e$message,
        "\n\n"
      )
      
      stop(
        "Pipeline stopped due to an error."
      )
      
    }
    
  )
  
}


# ------------------------------------------------------------
# Final summary
# ------------------------------------------------------------

cat("\n")
cat("====================================================\n")
cat(" PIPELINE COMPLETED SUCCESSFULLY\n")
cat("====================================================\n\n")

cat("Generated outputs:\n")

cat("  → data/processed/\n")
cat("  → output/figures/\n")
cat("  → output/models/\n")
cat("  → output/tables/\n")
cat("  → output/reports/\n\n")

cat(
  "IPK Twin-3 Barley Phenomics and Genomics analysis finished.\n"
)

cat(
  "Ready for reproducible research and GitHub publication.\n\n"
)
#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/vcgermline
========================================================================================
    Github : https://github.com/nf-core/vcgermline
    Website: https://nf-co.re/vcgermline
    Slack  : https://nfcore.slack.com/channels/vcgermline
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { VCGERMLINE } from './workflows/vcgermline'

//
// WORKFLOW: Run main nf-core/vcgermline analysis pipeline
//
workflow NFCORE_VCGERMLINE {
    VCGERMLINE ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_VCGERMLINE ()
}

/*
========================================================================================
    THE END
========================================================================================
*/

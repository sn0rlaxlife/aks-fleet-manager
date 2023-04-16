# aks-fleet-manager

This repository is to depict the use case of Azure Kubernetes Fleet Manager (Preview) as of 4/14/2023

<b>AKS is provisioned via TF</b>

The diagram shows the use case along with what is provisioned from this script (meant for demonstration purposes)


<h2> Register the fleet features prior to deploying</h2>
Run these commands to get your tenant to have access
<pre class="notranslate">
<code>
az extension add --name fleet
</code>
</pre>

<pre class="notranslate">
<code> cp tfvars .tfvars
terraform init --upgrade
terraform apply -var-file=.tfvars
</code>
</pre>

<b> Export variables </b>
<pre class="notranslate">
<code>


<b> Accessing the Kubernetes API</b>
1. Get the kubeconfig file of the Fleet Resource
<pre class="notranslate">
<code>
az fleet get-credentials --resource-group ${GROUP} --name ${FLEET}


<h3> Role Assignments</h3>

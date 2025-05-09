<hr>
<div class="panel panel-primary">
    <div class="panel-heading">Fiche de frais du mois
        <?php echo $numMois . '-' . $numAnnee ?>
    </div>
    <div class="panel-body">
        <strong><u>Etat :</u></strong> <?php echo $libEtat ?>
        depuis le <?php echo $dateModif ?> <br>
        <strong><u>Montant validé :</u></strong> <?php echo $montantValide ?>
    </div>
</div>
<div class="panel-heading">Eléments forfaitisés</div>
<div>
    <form action="<?= HOST; ?>validerFrais/action/modifierFicheFrais" method="POST">
        <table class="table table-bordered table-responsive">
            <tr>
                <?php
                foreach ($lesFraisForfait as $unFraisForfait) {
                    $libelle = $unFraisForfait['libelle']; ?>
                    <th class="text-center"> <?php echo htmlspecialchars($libelle) ?></th>
                    <?php
                }
                ?>
            </tr>
            <tr>
                <?php
                foreach ($lesFraisForfait as $unFraisForfait) {
                    if (isset($unFraisForfait['idfrais'])) {
                        $idFrais = $unFraisForfait['idfrais'];
                    }
                    $quantite = $unFraisForfait['quantite']; ?>
                    <td  class=" text-center qteForfait" ><input class="form-control" type="text" value="<?php echo $quantite ?>"
                            name="lesFrais[<?= $idFrais ?>]"></td>
                    <?php
                }
                ?>
            </tr>
        </table>
</div>


<input type="hidden" name="leVisiteur" value="<?= $visiteurSelectionne ?>">
<input type="hidden" name="lstMois" value="<?= $lstMois ?>">
<button class="btn btn-success" type="submit">Confirmer les modifications/Calculer le montant à valider</button>
<br>
&nbsp; 
</form>

<div class="panel panel-info">
    <div class="panel-heading">Descriptif des éléments hors forfait -
        <?php echo $nbJustificatifs ?> justificatifs reçus
    </div>
    <table class="table table-bordered table-responsive">
        <tr>
            <th class="date text-center" >Date</th>
            <th class="libelle text-center" >Libellé</th>
            <th class='montant text-center' >Montant</th>
            <th></th>
        </tr>
        <?php
        foreach ($lesFraisHorsForfait as $unFraisHorsForfait) {
            $date = $unFraisHorsForfait['date'];
            $libelle = htmlspecialchars($unFraisHorsForfait['libelle']);
            $montant = $unFraisHorsForfait['montant']; ?>
            <tr>
                <td><?php echo $date ?></td>
                <td><?php echo $libelle ?></td>
                <td><?php echo $montant ?></td>
                <td>
                    <form action="<?= HOST; ?>validerFrais/action/refuserHF" method="post">
                        <input type="hidden" name="leVisiteur" value="<?= $visiteurSelectionne ?>">
                        <input type="hidden" name="lstMois" value="<?= $lstMois ?>">
                        <input type="hidden" name="idFHF" value="<?= $unFraisHorsForfait['id'] ?>">

                        <input class="btn btn-danger" type="submit" value="Refuser" class="btn btn-danger">
                    </form>
                </td>
            </tr>
            <?php
        }
        ?>
    </table>
</div>
<form action="<?= HOST; ?>validerFrais/action/validerFicheFrais" method="POST">
    <input type="hidden" name="leVisiteur" value="<?= $visiteurSelectionne ?>">
    <input type="hidden" name="lstMois" value="<?= $lstMois ?>">
    <button class="btn btn-success" type="submit">Valider la fiche de frais</button>
</form>

</div>
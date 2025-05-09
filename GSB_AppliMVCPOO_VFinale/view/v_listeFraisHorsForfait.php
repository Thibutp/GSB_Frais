<?php
/**
 * Vue Liste des frais hors forfait
 *
 * PHP Version 8
 *
 * @category  AP
 * @package   GSB
 * @link      Contexte « Laboratoire GSB »
 */
?>
<hr>
<div class="row">
    <div class="panel panel-info">
        <div class="panel-heading">Descriptif des éléments hors forfait</div>
        <table class="table table-bordered table-responsive">
            <thead>
                <tr>
                    <th class="date">Date</th>
                    <th class="libelle">Libellé</th>
                    <th class="montant">Montant</th>
                    <th class="action">&nbsp;</th>
                </tr>
            </thead>
            <tbody>
            <?php
            foreach ($lesFraisHorsForfait as $unFraisHorsForfait) {
                $libelle = htmlspecialchars($unFraisHorsForfait['libelle']);
                $date = $unFraisHorsForfait['date'];
                $montant = $unFraisHorsForfait['montant'];
                $id = $unFraisHorsForfait['id']; ?>
                <tr>
                    <td> <?php echo $date ?></td>
                    <td> <?php echo $libelle ?></td>
                    <td><?php echo $montant ?></td>
                    <td>

                        <form action="<?= HOST; ?>gererFrais/action/supprimerFrais" method="post">
                            <input type="hidden" name="leVisiteur" value="<?= $visiteurSelectionne ?>">
                            <input type="hidden" name="lstMois" value="<?= $lstMois ?>">
                            <input type="hidden" name="idFrais" value="<?= $unFraisHorsForfait['id'] ?>">

                            <input class="btn btn-danger" type="submit" value="Supprimer" class="btn btn-danger">
                        </form>
                            
                    </td>
                </tr>
                <?php
            }
            ?>
            </tbody>
        </table>
    </div>
</div>
<div class="row">
    <h3>Nouvel élément hors forfait</h3>
    <div class="col-md-4">
        <form action="<?= HOST; ?>gererFrais/action/validerCreationFrais"
              method="post" role="form">
            <div class="form-group">
                <label for="txtDateHF">Date (jj/mm/aaaa): </label>
                <input type="text" id="txtDateHF" name="dateFrais"
                       class="form-control" id="text">
            </div>
            <div class="form-group">
                <label for="txtLibelleHF">Libellé</label>
                <input type="text" id="txtLibelleHF" name="libelle"
                       class="form-control" id="text">
            </div>
            <div class="form-group">
                <label for="txtMontantHF">Montant : </label>
                <div class="input-group">
                    <span class="input-group-addon">€</span>
                    <input type="text" id="txtMontantHF" name="montant"
                           class="form-control" value="">
                </div>
            </div>
            <button class="btn btn-success" type="submit">Ajouter</button>
            <button class="btn btn-danger" type="reset">Effacer</button>
        </form>
    </div>
</div>

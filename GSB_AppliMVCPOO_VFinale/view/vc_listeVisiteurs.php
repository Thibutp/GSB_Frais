<?php
/**
 * Vue Liste des visiteurs pour valider frais
 *
 * PHP Version 8
 *
 * @category  AP
 * @package   GSB
 * @link      Contexte « Laboratoire GSB »
 */
?>
<h2>Les fiches de frais</h2>
<div class="row">
    
    <div class="col-md-4">
        <form action="<?= HOST; ?>validerFrais/action/selectionnerMois"
              method="post" role="form">
            <div class="form-group">
                <label for="lstVisiteurs"><h3>Sélectionner un Visiteur : </h3></label>
                <select id="lstVisiteurs" name="lstVisiteurs" class="form-control">
                    <?php foreach ($lesVisiteurs as $visiteur): ?>
                        <option value="<?= $visiteur['id'] ;?>" >
                            <?= $visiteur['nom'] . ' ' . $visiteur['prenom']; ?>
                        </option>
                    <?php endforeach; ?>
                </select>
            </div>
            <input id="ok" type="submit" value="Valider" class="btn btn-success"
                   role="button">
            <input id="annuler" type="reset" value="Effacer" class="btn btn-danger"
                   role="button">
        </form>
    </div>
</div>
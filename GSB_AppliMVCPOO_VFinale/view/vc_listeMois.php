<?php
/**
 * Vue Liste des mois
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
                <label for="lstVisiteurs"><h3>Sélectionner un visiteur : </h3></label>
                <select id="lstVisiteurs" name="lstVisiteurs" class="form-control">
                    <?php foreach ($lesVisiteurs as $visiteur): ?>
                        <option value="<?= $visiteur['id'] ;?>" <?= isset($visiteurSelectionne) && $visiteurSelectionne == $visiteur['id'] ? 'selected' : '' ?> >
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

    <div class="col-md-2"></div>

    <div class="col-md-4">
        <form action="<?= HOST; ?>validerFrais/action/voirFiche"
              method="post" role="form">
            <div class="form-group">
                <label for="lstMois" accesskey="n"><h3>Sélectionner un mois : </h3></label>
                <select id="lstMois" name="lstMois" class="form-control">
                    <?php
                        foreach ($lesMois as $unMois) 
                        {
                            $mois = $unMois['mois'];
                            $numA = $unMois['numAnnee'];
                            $numM = $unMois['numMois'];
                            
                            if ($mois == $leMois) {
                                ?>
                                <option selected value="<?php echo $mois ?>">
                                    <?php echo $numM . '/' . $numA ?> </option>
                                <?php
                            } else 
                            {
                                if(isset($numMois) && isset($numAnnee) && $numM == $numMois && $numA == $numAnnee)
                                {
                                    ?>
                                    <option selected value="<?php echo $mois ?>">
                                        <?php echo $numMois . '/' . $numAnnee ?> </option>
                                    <?php
                                }
                                else
                                {
                                    ?>
                                    <option value="<?php echo $mois ?>">
                                        <?php echo $numM . '/' . $numA ?> </option>
                                    <?php
                                }
                            }
                        }
                    
                    ?>
                </select>
            </div>
            <input type="hidden" id="lstVisiteurs" name="lstVisiteurs" value="<?php echo $visiteurSelectionne ?>" />
            <input id="ok" type="submit" value="Valider" class="btn btn-success"
                   role="button">
            <input id="annuler" type="reset" value="Effacer" class="btn btn-danger"
                   role="button">
        </form>
    </div>
</div>

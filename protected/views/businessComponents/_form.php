<?php
/* @var $this BusinessComponentsController */
/* @var $model BusinessComponents */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'business-components-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'file_id'); ?>
		<?php echo $form->textField($model,'file_id',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'file_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'value_propositions'); ?>
		<?php echo $form->textArea($model,'value_propositions',array('rows'=>6, 'cols'=>50)); ?>
		<?php echo $form->error($model,'value_propositions'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->
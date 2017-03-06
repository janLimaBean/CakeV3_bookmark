<h1>Login</h1>
<?= $this->Form->create() ?>
<!--The control() is available since 3.4. For prior versions you can use the input() instead.-->
<?= $this->Form->control('email') ?>
<?= $this->Form->control('password') ?>
<?= $this->Form->button('Login') ?>
<?= $this->Form->end() ?>
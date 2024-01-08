<?php

// флаг остановки
$shallStopWorking = false;

/*// сигнал об остановке от supervisord
pcntl_signal(SIGTERM, function () use (&$shallStopWorking) {
    echo "Received SIGTERM\n";
    $shallStopWorking = true;
});

// обработчик для ctrl+c
pcntl_signal(SIGINT,  function () use (&$shallStopWorking) {
    echo "Received SIGINT\n";
    $shallStopWorking = true;
});*/

echo "Started\n";

while (!$shallStopWorking) {

    // обрабатываем задания из очереди, считаем статистику чего-либо,
    // или делаем ещё что-то очень важное

    // или совершенно бесполезное
    for ($i = 0; $i <= 10; $i++) {
        file_put_contents(__DIR__.'/worker.log', 'Cycle: '.$i.PHP_EOL, FILE_APPEND);
        sleep(120);
    }

    // обработаем сигналы в конце итерации
    //pcntl_signal_dispatch();
}

echo "Finished\n";

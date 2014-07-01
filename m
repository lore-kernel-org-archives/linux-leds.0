From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/1] leds: blinkm: Remove unused variable
Date: Tue, 1 Jul 2014 08:54:27 -0700
Message-ID: <CAK5ve-KYwnDuB0YooOo7zsZ_EH8VuJ_9ex_919CDEtJqiNrp=g@mail.gmail.com>
References: <1404216443-21177-1-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:33882 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751605AbaGAPys (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 1 Jul 2014 11:54:48 -0400
Received: by mail-la0-f46.google.com with SMTP id el20so6039291lab.19
        for <linux-leds@vger.kernel.org>; Tue, 01 Jul 2014 08:54:47 -0700 (PDT)
In-Reply-To: <1404216443-21177-1-git-send-email-sachin.kamat@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sachin Kamat <sachin.kamat@samsung.com>, =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <jansimon.moeller@gmx.de>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, spk.linux@gmail.com

On Tue, Jul 1, 2014 at 5:07 AM, Sachin Kamat <sachin.kamat@samsung.com> wrote:
> 'ret' is not used in the function. Remove it.
>

Removing it is easy but I guess we should check the return error status here.
Jan-Simon, what's your opinion then?

Thanks,
-Bryan

> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> ---
>  drivers/leds/leds-blinkm.c |    8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index d0452b099aee..f07f920ac0ac 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -441,14 +441,13 @@ static int blinkm_transfer_hw(struct i2c_client *client, int cmd)
>
>  static void led_work(struct work_struct *work)
>  {
> -       int ret;
>         struct blinkm_led *led;
>         struct blinkm_data *data;
>         struct blinkm_work *blm_work = work_to_blmwork(work);
>
>         led = blm_work->blinkm_led;
>         data = i2c_get_clientdata(led->i2c_client);
> -       ret = blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
> +       blinkm_transfer_hw(led->i2c_client, BLM_GO_RGB);
>         atomic_dec(&led->active);
>         dev_dbg(&led->i2c_client->dev,
>                         "# DONE # next_red = %d, next_green = %d,"
> @@ -546,9 +545,8 @@ static void blinkm_led_blue_set(struct led_classdev *led_cdev,
>
>  static void blinkm_init_hw(struct i2c_client *client)
>  {
> -       int ret;
> -       ret = blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
> -       ret = blinkm_transfer_hw(client, BLM_GO_RGB);
> +       blinkm_transfer_hw(client, BLM_STOP_SCRIPT);
> +       blinkm_transfer_hw(client, BLM_GO_RGB);
>  }
>
>  static int blinkm_test_run(struct i2c_client *client)
> --
> 1.7.9.5
>

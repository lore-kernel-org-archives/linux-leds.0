From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH] leds: lp55xx: avoid dereferencing a stale platform_data
 pointer
Date: Tue, 4 Aug 2015 10:07:34 +0900
Message-ID: <55C01056.2020404@ti.com>
References: <1438649224-21989-1-git-send-email-toshik@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:44752 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751438AbbHDBHi (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 3 Aug 2015 21:07:38 -0400
In-Reply-To: <1438649224-21989-1-git-send-email-toshik@chromium.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Toshi Kikuchi <toshik@chromium.org>
Cc: linux-leds@vger.kernel.org

Hi Toshi,

On 8/4/2015 9:47 AM, Toshi Kikuchi wrote:
> lp55xx_of_populate_pdata() allocates platform_data dynamically if DT
> is used. The memory area is allocated with devm_kzalloc() so it is
> automatically freed if the driver is unloaded. The driver should clear
> the pointer to platform_data before it is unloaded, otherwise it will
> use the stale pointer accidentally if the driver is reloaded.
>
> Change-Id: Ia097ed83b92cec5a52534a71dcb5322869c2a7b1
> Signed-off-by: Toshi Kikuchi <toshik@chromium.org>
> ---
>   drivers/leds/leds-lp5521.c | 3 +++
>   drivers/leds/leds-lp5523.c | 3 +++
>   drivers/leds/leds-lp5562.c | 3 +++
>   drivers/leds/leds-lp8501.c | 3 +++
>   4 files changed, 12 insertions(+)
>
> diff --git a/drivers/leds/leds-lp5521.c b/drivers/leds/leds-lp5521.c
> index 8ca197a..1f39922 100644
> --- a/drivers/leds/leds-lp5521.c
> +++ b/drivers/leds/leds-lp5521.c
> @@ -582,6 +582,9 @@ static int lp5521_remove(struct i2c_client *client)
>   	lp55xx_unregister_leds(led, chip);
>   	lp55xx_deinit_device(chip);
>
> +	if (client->dev.of_node)
> +		client->dev.platform_data = NULL;
> +
>   	return 0;
>   }
>
> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
> index 584dbbc..15e10da 100644
> --- a/drivers/leds/leds-lp5523.c
> +++ b/drivers/leds/leds-lp5523.c
> @@ -948,6 +948,9 @@ static int lp5523_remove(struct i2c_client *client)
>   	lp55xx_unregister_leds(led, chip);
>   	lp55xx_deinit_device(chip);
>
> +	if (client->dev.of_node)
> +		client->dev.platform_data = NULL;
> +
>   	return 0;
>   }
>
> diff --git a/drivers/leds/leds-lp5562.c b/drivers/leds/leds-lp5562.c
> index ca85724..32c8392 100644
> --- a/drivers/leds/leds-lp5562.c
> +++ b/drivers/leds/leds-lp5562.c
> @@ -582,6 +582,9 @@ static int lp5562_remove(struct i2c_client *client)
>   	lp55xx_unregister_leds(led, chip);
>   	lp55xx_deinit_device(chip);
>
> +	if (client->dev.of_node)
> +		client->dev.platform_data = NULL;
> +
>   	return 0;
>   }
>
> diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
> index d3098e3..e8542be 100644
> --- a/drivers/leds/leds-lp8501.c
> +++ b/drivers/leds/leds-lp8501.c
> @@ -376,6 +376,9 @@ static int lp8501_remove(struct i2c_client *client)
>   	lp55xx_unregister_leds(led, chip);
>   	lp55xx_deinit_device(chip);
>
> +	if (client->dev.of_node)
> +		client->dev.platform_data = NULL;
> +
>   	return 0;
>   }
>
>

Thanks a lot for catching this. I think it would be better to move these 
code to common part - 'leds-lp55xx-common.c' and call exported function 
in each driver.

Best regards,
Milo

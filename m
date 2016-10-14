From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: lp3952: Export I2C module alias information for
 module autoload
Date: Fri, 14 Oct 2016 15:57:44 +0200
Message-ID: <62a43403-4946-0ce0-0781-91e9f8961d92@samsung.com>
References: <CGME20161014122349eucas1p23c6870d6c9b6b729a65f4d94d1e8429a@eucas1p2.samsung.com>
 <1476447814-7996-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:64186 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754700AbcJNN5u (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 14 Oct 2016 09:57:50 -0400
In-reply-to: <1476447814-7996-1-git-send-email-javier@osg.samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

Hi Javier,

Thanks for the patch.
Applied to the for-4.10 branch of linux-leds.git.

Best regards,
Jacek Anaszewski

On 10/14/2016 02:23 PM, Javier Martinez Canillas wrote:
> If the driver is built as a module, I2C module alias information is not
> filled so the module won't be autoloaded if the device isn't registered
> over ACPI. Export the I2C device table alias with MODULE_DEVICE_TABLE()
> macro so the information is exported in the module.
>
> Before this patch:
>
> $ modinfo drivers/leds/leds-lp3952.ko | grep alias
> alias:          acpi*:TXNW3952:*
>
> After this patch:
>
> $ modinfo drivers/leds/leds-lp3952.ko | grep alias
> alias:          i2c:lp3952
> alias:          acpi*:TXNW3952:*
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
>
>  drivers/leds/leds-lp3952.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
> index a73c8ff08530..4847e89883a7 100644
> --- a/drivers/leds/leds-lp3952.c
> +++ b/drivers/leds/leds-lp3952.c
> @@ -274,6 +274,7 @@ static const struct i2c_device_id lp3952_id[] = {
>  	{LP3952_NAME, 0},
>  	{}
>  };
> +MODULE_DEVICE_TABLE(i2c, lp3952_id);
>
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id lp3952_acpi_match[] = {
>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2] LED/MIPS: Move SEAD3 LED driver to where it belongs.
Date: Mon, 3 Aug 2015 18:33:36 +0300
Message-ID: <55BF89D0.2080303@cogentembedded.com>
References: <20150803150401.GD2843@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20150803150401.GD2843@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Markos Chandras <markos.chandras@imgtec.com>
Cc: linux-leds@vger.kernel.org, linux-mips@linux-mips.org
List-Id: linux-leds@vger.kernel.org

Hello.

On 08/03/2015 06:04 PM, Ralf Baechle wrote:

> Fixes the following randconfig problem

> leds-sead3.c:(.text+0x7dc): undefined reference to `led_classdev_unregister'
> leds-sead3.c:(.text+0x7e8): undefined reference to `led_classdev_unregister'

> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Markos Chandras <markos.chandras@imgtec.com>
> Cc: linux-leds@vger.kernel.org
> Cc: linux-mips@linux-mips.org

[...]

> diff --git a/arch/mips/mti-sead3/leds-sead3.c b/drivers/leds/leds-sead3.c
> similarity index 99%
> rename from arch/mips/mti-sead3/leds-sead3.c
> rename to drivers/leds/leds-sead3.c
> index c938cee..eb97a32 100644
> --- a/arch/mips/mti-sead3/leds-sead3.c
> +++ b/drivers/leds/leds-sead3.c

     Oh, so you started to use -M finally. :-)

> @@ -59,6 +59,7 @@ static int sead3_led_remove(struct platform_device *pdev)
>   {
>   	led_classdev_unregister(&sead3_pled);
>   	led_classdev_unregister(&sead3_fled);
> +

    Unrelated white space change?

>   	return 0;
>   }

MBR, Sergei

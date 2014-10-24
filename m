From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/2] leds: delete copy/paste mistake
Date: Fri, 24 Oct 2014 10:54:41 -0700
Message-ID: <CAK5ve-LUOnXuRfm9zkh+pQnbyQkeDPNaRGGj93bOrsPm3ghQCA@mail.gmail.com>
References: <1414148226-12975-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169]:56263 "EHLO
	mail-ig0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932624AbaJXRzC (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 24 Oct 2014 13:55:02 -0400
Received: by mail-ig0-f169.google.com with SMTP id uq10so1076887igb.0
        for <linux-leds@vger.kernel.org>; Fri, 24 Oct 2014 10:55:01 -0700 (PDT)
In-Reply-To: <1414148226-12975-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Fri, Oct 24, 2014 at 3:57 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> A chunk of text followed the copied license text, ehm, sorry
> that kind of things happen from time to time.
>

Sure, let me merge this.

Thanks,
-Bryan

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/leds/leds-syscon.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
> index 3afec79c43f4..e0ccfc872c2f 100644
> --- a/drivers/leds/leds-syscon.c
> +++ b/drivers/leds/leds-syscon.c
> @@ -18,10 +18,6 @@
>   * along with this program; if not, write to the Free Software
>   * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
>   * MA 02111-1307 USA
> - *
> - * This driver provides system reboot functionality for APM X-Gene SoC.
> - * For system shutdown, this is board specify. If a board designer
> - * implements GPIO shutdown, use the gpio-poweroff.c driver.
>   */
>  #include <linux/io.h>
>  #include <linux/of_device.h>
> --
> 1.9.3
>

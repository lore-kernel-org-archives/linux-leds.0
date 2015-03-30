From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/2] leds:lp8860: Fix typo in MODULE_DESCRIPTION in leds-lp8860.c
Date: Mon, 30 Mar 2015 10:21:16 -0700
Message-ID: <CAK5ve-+YBcGf-ZAAVoj_Z0WxXZKB39kPbJ6qsQZBh-NE2_6+bQ@mail.gmail.com>
References: <1427709011-5057-1-git-send-email-standby24x7@gmail.com> <1427709011-5057-2-git-send-email-standby24x7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:36705 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753021AbbC3RVg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Mar 2015 13:21:36 -0400
Received: by iedm5 with SMTP id m5so123733861ied.3
        for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2015 10:21:36 -0700 (PDT)
In-Reply-To: <1427709011-5057-2-git-send-email-standby24x7@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Masanari Iida <standby24x7@gmail.com>
Cc: linux-kernel@vger.krenel.org, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Jiri Kosina <trivial@kernel.org>, Dan Murphy <dmurphy@ti.com>, =?UTF-8?B?6rmA7Jqw6rK4?= <milo.kim@ti.com>

On Mon, Mar 30, 2015 at 2:50 AM, Masanari Iida <standby24x7@gmail.com> wrote:
> This patch fix a spelling typo in MODULE_DESCRIPTION in
> leds-lp8860.c
>

merged thanks,
-Bryan

> Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> ---
>  drivers/leds/leds-lp8860.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
> index f2a29c2..8c2b7fb 100644
> --- a/drivers/leds/leds-lp8860.c
> +++ b/drivers/leds/leds-lp8860.c
> @@ -488,6 +488,6 @@ static struct i2c_driver lp8860_driver = {
>  };
>  module_i2c_driver(lp8860_driver);
>
> -MODULE_DESCRIPTION("Texas Instruments LP8860 LED drvier");
> +MODULE_DESCRIPTION("Texas Instruments LP8860 LED driver");
>  MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
>  MODULE_LICENSE("GPL");
> --
> 2.3.4.274.g92e625d
>

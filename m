From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/2] leds: lp8501: Fix typo in MODULE_DESCRIPTION in leds-lp8501.c
Date: Mon, 30 Mar 2015 10:20:46 -0700
Message-ID: <CAK5ve-JmiNVc9bcRXKzSB6ZWqEZ_8tfpph6Nxx4HZZUaHxQ7rQ@mail.gmail.com>
References: <1427709011-5057-1-git-send-email-standby24x7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:34960 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753241AbbC3RVH (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Mar 2015 13:21:07 -0400
Received: by igcau2 with SMTP id au2so81606282igc.0
        for <linux-leds@vger.kernel.org>; Mon, 30 Mar 2015 10:21:07 -0700 (PDT)
In-Reply-To: <1427709011-5057-1-git-send-email-standby24x7@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Masanari Iida <standby24x7@gmail.com>
Cc: linux-kernel@vger.krenel.org, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Jiri Kosina <trivial@kernel.org>, Dan Murphy <dmurphy@ti.com>, =?UTF-8?B?6rmA7Jqw6rK4?= <milo.kim@ti.com>

On Mon, Mar 30, 2015 at 2:50 AM, Masanari Iida <standby24x7@gmail.com> wrote:
> This patch fix a spelling typo in MODULE_DESCRIPTION in
> leds-lp8501.c
>

merged. thanks.

-Bryan

> Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> ---
>  drivers/leds/leds-lp8501.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
> index 00f068b..d3098e3 100644
> --- a/drivers/leds/leds-lp8501.c
> +++ b/drivers/leds/leds-lp8501.c
> @@ -406,6 +406,6 @@ static struct i2c_driver lp8501_driver = {
>
>  module_i2c_driver(lp8501_driver);
>
> -MODULE_DESCRIPTION("Texas Instruments LP8501 LED drvier");
> +MODULE_DESCRIPTION("Texas Instruments LP8501 LED driver");
>  MODULE_AUTHOR("Milo Kim");
>  MODULE_LICENSE("GPL");
> --
> 2.3.4.274.g92e625d
>

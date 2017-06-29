From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: lp55xx: make various arrays static const
Date: Thu, 29 Jun 2017 21:40:58 +0200
Message-ID: <d57c8cab-4577-d227-64df-553b948566d9@gmail.com>
References: <20170629175738.12467-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:34290 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752407AbdF2Ttg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Jun 2017 15:49:36 -0400
In-Reply-To: <20170629175738.12467-1-colin.king@canonical.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Colin King <colin.king@canonical.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

Thanks for the patch.

Do you have some profiling results showing the benefit of these changes?
It seems that these functions are called only on driver initialization.
Making the local arrays static will prevent releasing this memory even
though it will be no longer needed.

Anyway, the size of arrays is 3 bytes, so the impact of these changes
seems to be virtually negligible. I am not taking this patch unless
you are able to provide the numbers showing the gain.

Best regards,
Jacek Anaszewski

On 06/29/2017 07:57 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Several arrays are currently on-stack and instead should be made
> static const.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/leds/leds-lp5523.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
> index e9ba8cd32d66..924e50aefb00 100644
> --- a/drivers/leds/leds-lp5523.c
> +++ b/drivers/leds/leds-lp5523.c
> @@ -168,13 +168,13 @@ static int lp5523_post_init_device(struct lp55xx_chip *chip)
>  static void lp5523_load_engine(struct lp55xx_chip *chip)
>  {
>  	enum lp55xx_engine_index idx = chip->engine_idx;
> -	u8 mask[] = {
> +	static const u8 mask[] = {
>  		[LP55XX_ENGINE_1] = LP5523_MODE_ENG1_M,
>  		[LP55XX_ENGINE_2] = LP5523_MODE_ENG2_M,
>  		[LP55XX_ENGINE_3] = LP5523_MODE_ENG3_M,
>  	};
>  
> -	u8 val[] = {
> +	static const u8 val[] = {
>  		[LP55XX_ENGINE_1] = LP5523_LOAD_ENG1,
>  		[LP55XX_ENGINE_2] = LP5523_LOAD_ENG2,
>  		[LP55XX_ENGINE_3] = LP5523_LOAD_ENG3,
> @@ -188,7 +188,7 @@ static void lp5523_load_engine(struct lp55xx_chip *chip)
>  static void lp5523_load_engine_and_select_page(struct lp55xx_chip *chip)
>  {
>  	enum lp55xx_engine_index idx = chip->engine_idx;
> -	u8 page_sel[] = {
> +	static const u8 page_sel[] = {
>  		[LP55XX_ENGINE_1] = LP5523_PAGE_ENG1,
>  		[LP55XX_ENGINE_2] = LP5523_PAGE_ENG2,
>  		[LP55XX_ENGINE_3] = LP5523_PAGE_ENG3,
> @@ -208,7 +208,7 @@ static void lp5523_stop_all_engines(struct lp55xx_chip *chip)
>  static void lp5523_stop_engine(struct lp55xx_chip *chip)
>  {
>  	enum lp55xx_engine_index idx = chip->engine_idx;
> -	u8 mask[] = {
> +	static const u8 mask[] = {
>  		[LP55XX_ENGINE_1] = LP5523_MODE_ENG1_M,
>  		[LP55XX_ENGINE_2] = LP5523_MODE_ENG2_M,
>  		[LP55XX_ENGINE_3] = LP5523_MODE_ENG3_M,
> @@ -505,7 +505,7 @@ static int lp5523_load_mux(struct lp55xx_chip *chip, u16 mux, int nr)
>  {
>  	struct lp55xx_engine *engine = &chip->engines[nr - 1];
>  	int ret;
> -	u8 mux_page[] = {
> +	static const u8 mux_page[] = {
>  		[LP55XX_ENGINE_1] = LP5523_PAGE_MUX1,
>  		[LP55XX_ENGINE_2] = LP5523_PAGE_MUX2,
>  		[LP55XX_ENGINE_3] = LP5523_PAGE_MUX3,
> 

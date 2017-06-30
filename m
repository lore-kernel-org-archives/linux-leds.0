From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: lp55xx: make various arrays static const
Date: Fri, 30 Jun 2017 23:26:50 +0200
Message-ID: <1d5d4c21-32db-447e-1715-54a7eb959ad0@gmail.com>
References: <20170629175738.12467-1-colin.king@canonical.com>
 <d57c8cab-4577-d227-64df-553b948566d9@gmail.com> <20170629204831.GA763@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20170629204831.GA763@amd>
Sender: kernel-janitors-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Colin King <colin.king@canonical.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 06/29/2017 10:48 PM, Pavel Machek wrote:
> Hi!
> 
>> Thanks for the patch.
>>
>> Do you have some profiling results showing the benefit of these changes?
>> It seems that these functions are called only on driver initialization.
>> Making the local arrays static will prevent releasing this memory even
>> though it will be no longer needed.
>>
>> Anyway, the size of arrays is 3 bytes, so the impact of these changes
>> seems to be virtually negligible. I am not taking this patch unless
>> you are able to provide the numbers showing the gain.
> 
> C will have to initialize the array on stack, then copy values

OK, similar justification is used in case of few other similar patches.

Applied to the for-next branch of linux-leds.git. It's rather
cosmetic change so only a few days of testing before sending
upstream should be enough.

Thanks,
Jacek Anaszewski

> there.. which is ugly. "static const" also tells the reader what is
> going on there (nothing).
> 
> I'd say this is a good patch.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
>>> +++ b/drivers/leds/leds-lp5523.c
>>> @@ -168,13 +168,13 @@ static int lp5523_post_init_device(struct lp55xx_chip *chip)
>>>  static void lp5523_load_engine(struct lp55xx_chip *chip)
>>>  {
>>>  	enum lp55xx_engine_index idx = chip->engine_idx;
>>> -	u8 mask[] = {
>>> +	static const u8 mask[] = {
>>>  		[LP55XX_ENGINE_1] = LP5523_MODE_ENG1_M,
>>>  		[LP55XX_ENGINE_2] = LP5523_MODE_ENG2_M,
>>>  		[LP55XX_ENGINE_3] = LP5523_MODE_ENG3_M,
>>>  	};
>>>  
>>> -	u8 val[] = {
>>> +	static const u8 val[] = {
>>>  		[LP55XX_ENGINE_1] = LP5523_LOAD_ENG1,
>>>  		[LP55XX_ENGINE_2] = LP5523_LOAD_ENG2,
>>>  		[LP55XX_ENGINE_3] = LP5523_LOAD_ENG3,
>>> @@ -188,7 +188,7 @@ static void lp5523_load_engine(struct lp55xx_chip *chip)
>>>  static void lp5523_load_engine_and_select_page(struct lp55xx_chip *chip)
>>>  {
>>>  	enum lp55xx_engine_index idx = chip->engine_idx;
>>> -	u8 page_sel[] = {
>>> +	static const u8 page_sel[] = {
>>>  		[LP55XX_ENGINE_1] = LP5523_PAGE_ENG1,
>>>  		[LP55XX_ENGINE_2] = LP5523_PAGE_ENG2,
>>>  		[LP55XX_ENGINE_3] = LP5523_PAGE_ENG3,
>>> @@ -208,7 +208,7 @@ static void lp5523_stop_all_engines(struct lp55xx_chip *chip)
>>>  static void lp5523_stop_engine(struct lp55xx_chip *chip)
>>>  {
>>>  	enum lp55xx_engine_index idx = chip->engine_idx;
>>> -	u8 mask[] = {
>>> +	static const u8 mask[] = {
>>>  		[LP55XX_ENGINE_1] = LP5523_MODE_ENG1_M,
>>>  		[LP55XX_ENGINE_2] = LP5523_MODE_ENG2_M,
>>>  		[LP55XX_ENGINE_3] = LP5523_MODE_ENG3_M,
>>> @@ -505,7 +505,7 @@ static int lp5523_load_mux(struct lp55xx_chip *chip, u16 mux, int nr)
>>>  {
>>>  	struct lp55xx_engine *engine = &chip->engines[nr - 1];
>>>  	int ret;
>>> -	u8 mux_page[] = {
>>> +	static const u8 mux_page[] = {
>>>  		[LP55XX_ENGINE_1] = LP5523_PAGE_MUX1,
>>>  		[LP55XX_ENGINE_2] = LP5523_PAGE_MUX2,
>>>  		[LP55XX_ENGINE_3] = LP5523_PAGE_MUX3,
>>>
> 

-- 
Best regards,
Jacek Anaszewski

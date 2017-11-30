From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: pm8058: Make ledtype pointer sized type
Date: Thu, 30 Nov 2017 22:58:55 +0100
Message-ID: <545eb1a6-3235-9fe6-1d0d-958aa13e5170@gmail.com>
References: <20171130113516.42c8bde2@canb.auug.org.au>
 <20171130030543.1071-1-bjorn.andersson@linaro.org>
 <20171130094019.GA21887@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <20171130094019.GA21887@amd>
Sender: linux-next-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 11/30/2017 10:40 AM, Pavel Machek wrote:
> On Wed 2017-11-29 19:05:43, Bjorn Andersson wrote:
>> The pointer returned by of_device_get_match_data() doesn't have the same
>> size as u32 on 64-bit architectures, causing issues when compile testing
>> the driver on such platform. Make ledtype unsigned long instead, to
>> solve this problem.
>>
>> Fixes: 7f866986e705 ("leds: add PM8058 LEDs driver")
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Ummm... no?
> 
> extern const void *of_device_get_match_data(const struct device *dev);
> 
> 
>> diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
>> index a52674327857..cc2afe81720d 100644
>> --- a/drivers/leds/leds-pm8058.c
>> +++ b/drivers/leds/leds-pm8058.c
>> @@ -29,7 +29,7 @@
>>  struct pm8058_led {
>>  	struct regmap *map;
>>  	u32 reg;
>> -	u32 ledtype;
>> +	unsigned long ledtype;
> 
> Make it void *. u32 is buggy. unsigned long is merely ugly code. void
> * is not nice, but certainly better than unsigned long.

unsigned long is correct, see below:

static const struct of_device_id pm8058_leds_id_table[] = {
        {
                .compatible = "qcom,pm8058-led",
                .data = (void *)PM8058_LED_TYPE_COMMON
        },
        {
                .compatible = "qcom,pm8058-keypad-led",
                .data = (void *)PM8058_LED_TYPE_KEYPAD
        },
        {
                .compatible = "qcom,pm8058-flash-led",
                .data = (void *)PM8058_LED_TYPE_FLASH
        },
        { },
};

of_device_get_match_data will return PM8058_LED_TYPE_*
which clearly is a led type identifier.

Thus unsigned long looks reasonable.

-- 
Best regards,
Jacek Anaszewski

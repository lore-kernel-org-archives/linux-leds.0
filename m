From: "Kim, Milo" <milo.kim@ti.com>
Subject: Re: [PATCH RESEND 06/16] mfd: add TI LMU driver
Date: Tue, 24 Nov 2015 11:35:51 +0900
Message-ID: <5653CD07.2090602@ti.com>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-7-git-send-email-milo.kim@ti.com> <20151123103025.GJ3098@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:56553 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752655AbbKXChY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 23 Nov 2015 21:37:24 -0500
In-Reply-To: <20151123103025.GJ3098@x1>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Mark Brown <broonie@kernel.org>, lm-sensors@lm-sensors.org, linux-leds@vger.kernel.org

Hi Lee,

Thanks for all your comments. Please see my comments below.

On 11/23/2015 7:30 PM, Lee Jones wrote:
>> +int ti_lmu_read_byte(struct ti_lmu *lmu, u8 reg, u8 *read)
>> >+{
>> >+	int ret;
>> >+	unsigned int val;
>> >+
>> >+	ret = regmap_read(lmu->regmap, reg, &val);
>> >+	if (ret < 0)
>> >+		return ret;
>> >+
>> >+	*read = (u8)val;
>> >+	return 0;
>> >+}
>> >+EXPORT_SYMBOL_GPL(ti_lmu_read_byte);
> It doesn't get much more simple than this.
>
> What's the purpose of abstracting it?
>
>> >+int ti_lmu_write_byte(struct ti_lmu *lmu, u8 reg, u8 data)
>> >+{
>> >+	return regmap_write(lmu->regmap, reg, data);
>> >+}
>> >+EXPORT_SYMBOL_GPL(ti_lmu_write_byte);
>> >+
>> >+int ti_lmu_update_bits(struct ti_lmu *lmu, u8 reg, u8 mask, u8 data)
>> >+{
>> >+	return regmap_update_bits(lmu->regmap, reg, mask, data);
>> >+}
>> >+EXPORT_SYMBOL_GPL(ti_lmu_update_bits);
> Okay, I lied, it does get more simple.
>
> Seems like abstraction for the sake of abstraction here.
>
> Feel free to try and convince me otherwise.
>

The main reason was that LMU MFD core provides consistent register 
access among LMU drivers like ti-lmu-backlight, leds-lm3633, 
lm363x-regulator and ti-lmu-fault-monitor('ti-lmu-hwmon' will be changed 
to this in the 2nd patch).

However, LMU register helpers are exactly same as regmap interface 
except using ti_lmu data structure. So let me replace them with regmap 
functions. Thanks for pointing this out.

Best regards,
Milo

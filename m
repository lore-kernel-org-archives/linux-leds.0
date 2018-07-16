From: Baolin Wang <baolin.wang@linaro.org>
Subject: Re: [PATCH v4 1/2] leds: core: Introduce generic pattern interface
Date: Mon, 16 Jul 2018 10:14:40 +0800
Message-ID: <CAMz4ku+robho1J2CP-384r9PnfmCyN2WDdkLXAwQtkeDXUYijA@mail.gmail.com>
References: <a0b874372f9ccd0491b54c79ac63b41812efef56.1531460834.git.baolin.wang@linaro.org>
 <20180714062916.GB13242@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180714062916.GB13242@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 14 July 2018 at 14:29, Pavel Machek <pavel@ucw.cz> wrote:
>
>> @@ -446,4 +455,14 @@ static inline void led_classdev_notify_brightness_hw_changed(
>>       struct led_classdev *led_cdev, enum led_brightness brightness) { }
>>  #endif
>>
>> +/**
>> + * struct led_pattern - brigheness value in a pattern
>
> "brightness".

Will fix the typo. Thanks.

-- 
Baolin Wang
Best Regards

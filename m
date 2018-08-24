From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 1/2] leds: core: Introduce LED pattern trigger
Date: Fri, 24 Aug 2018 21:49:50 +0200
Message-ID: <9bb7ac19-36a6-d11a-6d46-fc65c2026201@gmail.com>
References: <1dc5d394324b2bf1ffe229b8e42691fab6d749e0.1533556992.git.baolin.wang@linaro.org>
 <c18fd41f-831c-ab74-57e5-d4151f4b47cc@gmail.com> <20180824101145.GA1510@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180824101145.GA1510@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Baolin Wang <baolin.wang@linaro.org>, rteysseyre@gmail.com, bjorn.andersson@linaro.org, broonie@kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 08/24/2018 12:11 PM, Pavel Machek wrote:
> Hi!
> 
>> I think that it would be more flexible if software pattern fallback
>> was applied in case of pattern_set failure. Otherwise, it would
>> lead to the situation where LED class devices that support hardware
>> blinking couldn't be applied the same set of patterns as LED class
>> devices that don't implement pattern_set. The latter will always have to
>> resort to using software pattern engine which will accept far greater
>> amount of pattern combinations.
>>
>> In this case we need to discuss on what basis the decision will be
>> made on whether hardware or software engine will be used.
>>
>> Possible options coming to mind:
>> - an interface will be provided to determine max difference between
>>   the settings supported by the hardware and the settings requested by
>>   the user, that will result in aligning user's setting to the hardware
>>   capabilities
>> - the above alignment rate will be predefined instead
>> - hardware engine will be used only if user requests supported settings
>>   on the whole span of the requested pattern
>> - in each of the above cases it would be worth to think of the
>>   interface to show the scope of the settings supported by hardware
> 
> I'd recommend keeping it simple. We use hardware engine if driver
> author thinks pattern is "close enough".

The thing is that in the ledtrig-pattern v5 implementation there
is no option of using software fallback if pattern_set op
is initialized:

+	if (led_cdev->pattern_set) {
+		return led_cdev->pattern_set(led_cdev, data->patterns,
+					     data->npatterns, data->repeat);
+	}

> If human can not tell the difference, it probably is.
> 
> We may want to do something more formal later.

-- 
Best regards,
Jacek Anaszewski

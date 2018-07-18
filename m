From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 1/2] leds: core: Introduce generic pattern interface
Date: Wed, 18 Jul 2018 21:22:05 +0200
Message-ID: <0e0cd8f7-dc73-6733-65f2-9a14506b0f0e@gmail.com>
References: <CAMz4kuJfPKykB6G-8C25mmMCfQgefv-Y=k2OQYZR_e0Tvg3guQ@mail.gmail.com>
 <8da1b769-8aa3-9698-467a-2e7b0707fecf@gmail.com>
 <CAMz4kuKZ6Z1h=yzFYJihEH1ARC5FKtDC6RLz0u8SmaekOZ=utw@mail.gmail.com>
 <20180714212033.GA31950@amd> <00fa2693-9308-8d74-0124-04066a76c35a@gmail.com>
 <20180714222924.GA2776@amd> <20180714223907.GB2776@amd>
 <1138f834-e805-6076-bb5b-aa1fdc1f2606@gmail.com>
 <2c3a8911-150a-9b25-2a66-a9432047f96b@lechnology.com>
 <68996338-a902-2b57-0bb9-df274a496b06@gmail.com> <20180718075637.GA10279@amd>
 <913151e4-c19f-9a22-697c-52a9fb48cb32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <913151e4-c19f-9a22-697c-52a9fb48cb32@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: David Lechner <david@lechnology.com>, Baolin Wang <baolin.wang@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 07/18/2018 08:54 PM, Jacek Anaszewski wrote:
> On 07/18/2018 09:56 AM, Pavel Machek wrote:
>> Hi!
>>
>>>>>>> I believe I meant "changing patterns from kernel in response to 
>>>>>>> events
>>>>>>> is probably overkill"... or something like that.
>>>>>>
>>>>>> Anyway -- to clean up the confusion -- I'd like to see
>>>>>>
>>>>>> echo pattern > trigger
>>>>>> echo "1 2 3 4 5 6 7 8" > somewhere
>>>>>
>>>>> s/somewhere/pattern/
>>>>>
>>>>> pattern trigger should create "pattern" file similarly how 
>>>>> ledtrig-timer
>>>>> creates delay_{on|off} files.
>>
>> Yes, that sounds reasonable. v5 still says
>>
>> +               Writing non-empty string to this file will activate 
>> the pattern,
>> +               and empty string will disable the pattern.
>>
>> I'd deactivate the pattern by simply writing something else to the
>> trigger file.
> 
> Please keep in mind that this is ABI documentation for the pattern file
> to be exposed by LED core, and not by the pattern trigger, that, as we
> agreed, will be implemented later. In this case, I'd go for

Gosh, I got completely distracted by the recent discussion about
pattern synchronization.

So, to recap, we need to decide if we are taking Baolin's solution
or we're opting for implementing pattern trigger.

If we choose the latter, then we will also need some software
pattern engine in the trigger, to be applied as a software pattern
fallback for the devices without hardware pattern support.
It will certainly delay the contribution process, provided that Baolin
would find time for this work at all.

I'd just take v5 based solution for now (with improved semantics
of disabling pattern - in this case my reasoning from the message
I'm replying to is still valid),

> "echo 0 > brightness" as a command disabling pattern. The same operation
> disables triggers, so later transition to using pattern trigger will be
> seamless for userspace.
> 

-- 
Best regards,
Jacek Anaszewski

From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3 1/2] leds: core: Introduce generic pattern interface
Date: Wed, 18 Jul 2018 12:00:29 -0500
Message-ID: <47b1b143-48dd-a265-c2af-254dda53a2cc@lechnology.com>
References: <CAMz4kuKZ6Z1h=yzFYJihEH1ARC5FKtDC6RLz0u8SmaekOZ=utw@mail.gmail.com>
 <20180714212033.GA31950@amd> <00fa2693-9308-8d74-0124-04066a76c35a@gmail.com>
 <20180714222924.GA2776@amd> <20180714223907.GB2776@amd>
 <1138f834-e805-6076-bb5b-aa1fdc1f2606@gmail.com>
 <2c3a8911-150a-9b25-2a66-a9432047f96b@lechnology.com>
 <68996338-a902-2b57-0bb9-df274a496b06@gmail.com> <20180718075637.GA10279@amd>
 <CAMz4kuJa=s19q7wQFQT1giUe0AN4hpux4PG2koUcnE7q_x7LCQ@mail.gmail.com>
 <20180718120836.GB23157@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180718120836.GB23157@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Baolin Wang <baolin.wang@linaro.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org



On 7/18/18 7:08 AM, Pavel Machek wrote:
> On Wed 2018-07-18 19:32:01, Baolin Wang wrote:
>> On 18 July 2018 at 15:56, Pavel Machek <pavel@ucw.cz> wrote:
>>> Hi!
>>>
>>>>>>>> I believe I meant "changing patterns from kernel in response to events
>>>>>>>> is probably overkill"... or something like that.
>>>>>>>
>>>>>>> Anyway -- to clean up the confusion -- I'd like to see
>>>>>>>
>>>>>>> echo pattern > trigger
>>>>>>> echo "1 2 3 4 5 6 7 8" > somewhere
>>>>>>
>>>>>> s/somewhere/pattern/
>>>>>>
>>>>>> pattern trigger should create "pattern" file similarly how ledtrig-timer
>>>>>> creates delay_{on|off} files.
>>>
>>> Yes, that sounds reasonable. v5 still says
>>>
>>> +               Writing non-empty string to this file will activate the pattern,
>>> +               and empty string will disable the pattern.
>>>
>>> I'd deactivate the pattern by simply writing something else to the
>>> trigger file.
>>
>> For the case we met in patch 2, it is not related with trigger things.
>> We just set some series of tuples including brightness and duration
>> (ms) to the hardware to enable the breath mode of the LED, we did not
>> trigger anything. So it is weird to write something to trigger file to
>> deactive the pattern.
> 
> Confused. I thought that "breathing mode" would be handled similar way
> to hardware blinking: userland selects pattern trigger, pattern file
> appears (similar way to delay_on/delay_off files with blinking), he
> configures it, hardware brightness follows the pattern ("breathing
> mode"). If pattern is no longer required, echo none > trigger stops
> it.
> 									Pavel
> 

I was confused too when I first read this thread. But after reviewing 
v5, it is clear that this is _not_ a trigger (and it should not be a 
trigger). This is basically the equivalent the brightness attribute - 
except that now the brightness changes over time instead of being a 
constant value. This way, the pattern can be used in conjunction with 
triggers.

For example, one might want to set the _pattern_ to something like a 
"breathe" pattern and set the _trigger_ to the power supply charging 
full trigger. This way, the LED will be off until the battery is full 
and then the LED will "breath" when the battery is full.

From: Olliver Schinagl <oliver@schinagl.nl>
Subject: Re: [PATCHv1 0/6] leds: pca9653x: support inverted outputs and
 cleanups
Date: Thu, 12 May 2016 11:07:19 +0200
Message-ID: <573447C7.1060100@schinagl.nl>
References: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
 <5715F927.3030102@samsung.com> <5715FCE8.7080106@schinagl.nl>
 <CAPybu_02_5pZ6pMkXwaHtjJAfXiWPniWEHcayRoCMypfgeLD_w@mail.gmail.com>
 <57163252.5090000@schinagl.nl>
 <CAPybu_2uZqR4exnS08taVYyr=ziK+EzuJy+_FxhbtqSiOE_=mw@mail.gmail.com>
 <57172DFA.9030107@schinagl.nl>
 <CAPybu_2fys29MUTBCDPb+tpfCgbr9SL+LXq061Tq20_z7UO-Vg@mail.gmail.com>
 <5717430D.30702@schinagl.nl>
 <CAPybu_3=VdXR_X_00EiYMyhRPLsR40GW1kHS5rzdOkSzrCMVWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPybu_3=VdXR_X_00EiYMyhRPLsR40GW1kHS5rzdOkSzrCMVWg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>
List-Id: linux-leds@vger.kernel.org

Hey Ricardo,

On 11-05-16 23:38, Ricardo Ribalda Delgado wrote:
> Some update
>
> I have not received anything to test it and I will be out of the
> office from today until the 30th :S. So it seems that I have not way
> to test the changes.
That's understandable, meanwhile I've been running some experiments and 
mostly reading the datasheet more closely. You hadn't replied to my 
earlier mention of it so I'll only talk about that now.

Right now, the GDC (e.g. GRPPWM) register is set via some math using the 
period:
     /*
      * From manual: duty cycle = (GDC / 256) ->
      *    (time_on / period) = (GDC / 256) ->
      *        GDC = ((time_on * 256) / period)
      */
     gdc = (time_on * 256) / period;

This is wrong in my opinion, as the manual states:

When DMBLNK bit is programmed with 1, GRPPWM and GRPFREQ registers define a
global blinking pattern, where GRPFREQ contains the blinking period 
(from 24 Hz to
10.73 s) and GRPPWM the duty cycle (ON/OFF ratio in %).

First, when DMBLNK is programmed with 0, GRPFREQ is a don't care, so no 
'blinking' takes place. Which means, since we want blink_set to work, we 
need DMBLNK and that can be enabled by default, as the LDR register 
controls whether we can blink at all (11b vs 10b)

Then the GRPFREQ register, as done now, sets a frequency for the blink 
between 41ms and 10.73 seconds.

Finally, the GRPPWM/gdc register can be used to globally control the 
brightness of leds which are linked (via LDR=11b). So if we have a color 
setup, e.g. #4488FF and we globally dim this color via gdc to 10%, we 
get #04080F on the output. To add this behavior we'd be adding some more 
hacks as the led framework doesn't really support linked outputs at all, 
(nice new feature, to link leds together with a global control?, other 
subsystems do something like that, cpufreq i guess) who decides the 
value of gdc. There is no toggle to set the global brightness. What 
could be possible, is to leave whatever setting is in the brightness and 
read/report the individual led brightness as it where the gdc. Which 
could actually work thinking about it. But (and I think it is impossible 
now anyway) it would break individual color control during the blink. 
e.g. /sys/class/led/[red,green,blue]/brightness are always equal and 
writing to either during blink sets the global brightness.

But that should be a separate patch that I'm thinking a bit more about.

So for now, I recommend to set GRPPWM initially to 0xff, e.g. leds full 
on, until the above patch is added. We then blink at whatever color is 
set to the output and only control the blink via the GRPFREQ, without 
the possibility to change brightness during a blink.

Olliver
> Sorry about that.
>
> Regards!
>
> On Fri, Apr 22, 2016 at 10:48 AM, Ricardo Ribalda Delgado
> <ricardo.ribalda@gmail.com>  wrote:
>> Hi
>>
>> I  am on trip until next monday. I have arranged also some hw to be sent to
>> me that day.
>>
>> Can we continue the conversation then? I know I told you that I will review
>> this yesterday, but I did not have the time , sorry
>>
>> Regards!
>>
>> On 22 Apr 2016 09:21, "Olliver Schinagl"<oliver@schinagl.nl>  wrote:
>>
>> Hi Ricardo,
>>
>>
>> On 20-04-16 11:17, Ricardo Ribalda Delgado wrote:
>>> Hello again
>>>
>>> On Wed, Apr 20, 2016 at 11:06 AM, Olliver Schinagl<oliver@schinagl.nl>
>>> wrote:
>>>
>>>> The devil is in the details :)
>>> :)
>>>>> Saving mode2 sounds like a good compromise then.
>>>>>
>>>>> But I still believe that we should limit the lock to ledout. No matter
>>>>> what we do, we cannot have two leds blinking at different frequencies
>>>>> on the same chip.
>>>> So to save a mutex a little bit, we take the risk that nobody else
>>>> enables
>>>> the blink or if they do, enable it in the same way?
>>>> If it saves so much, then I guess its worth the risk I suppose?
>>> Give me a day to go through the chip doc and see if I can find a good
>>> compromise, that at least warranties that the leds that are enable
>>> stay enabled ;)
>> Right, I also went over the datasheet, and I think we can simplyfy two
>> things.
>>
>> For one, yes, move the mode2 register completly to the probe section. Set
>> the DMBLINK led to always 1. It does not get cleared, I was wrong. We have
>> to set it to as with 0 we do not get any blinking at all (grpfreq gets
>> ignored).
>>
>> Furthermore, we should change:
>>   -    gdc = (time_on * 256) / period;
>> +   gdc = 0x00;
>>
>> Because the calculation does not make sense. GDC is the global
>> brightness/pwm/dimming control. It is used to uniformly change the blink
>> rate on all the linked leds.
>>
>> "General brightness for the 16 outputs is controlled through 256 linear
>> steps to FFh"
>> I don't think that is the intention of the gdc is it? Looking at the
>> original gdc code, it thus sets the global BRIGHTNESS based on the
>> period/on_time. I don't think that is what we expect when we enable blink.
>>
>>  From my understanding, the grppwm is super-imposed, thus by setting gdc to
>> 0, we do not superimpose anything and the original brightness is retained.
>> (If i'm wrong here, we need to set gdc to 0xff.
>>
>> Because of this, I even recommend removing gdc all together, which saves
>> another i2c write.
>>
>> Or am I wrong here?
>>
>> Olliver
>>> Regards!
>>>
>>>
>>>

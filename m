From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH] leds: multicolor: Add sysfs interface definition
Date: Fri, 8 Feb 2019 10:55:14 -0600
Message-ID: <cf99d7f3-5e79-bd18-094f-54efca5f576c@ti.com>
References: <20190130183005.833-1-dmurphy@ti.com> <20190130223542.GA22040@amd>
 <6afa674b-9c4e-2568-c758-030e93aebd06@gmail.com>
 <6d50b09c-87be-d48f-cfe5-f5143c18d38c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6d50b09c-87be-d48f-cfe5-f5143c18d38c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Veas

On 2/7/19 11:09 PM, Vesa Jääskeläinen wrote:
> Hi All,
> 
> On 08/02/2019 6.55, Vesa Jääskeläinen wrote:
>> Hi All,
>>
>> On 31/01/2019 0.35, Pavel Machek wrote:
>>> On Wed 2019-01-30 12:30:05, Dan Murphy wrote:
>>>> Add a documentation of LED Multicolor LED class specific
>>>> sysfs attributes.
>>>
>>> No, sorry. This does not most of the requirements.
>>>
>>>                                 Pavel
>>>
>>> Requirements for RGB LED interface:
>>
>> ...
>>
>> I have tried to capture relevant parts of ideas and requirements and usage in a wiki page in github:
>>
>> https://github.com/vesajaaskelainen/linux-multicolor-leds/wiki
>>
>> I believe the discussion is good to perform in mailing list -- I am happy to update or give you access to update the wiki so we could have easy to use summary/details source during discussions.
>>
>> Ideas on the interface seem to be a bit drifting so I apologize if some of Your ideas were not captured.
>>
>> There has been at least two direct proposals for userspace interface and I tried to provide usage example also for Dan's proposal. Feel free to correct me if I made a mistake.
>>
>> I believe it is a good to create summary page as there seems to many aspects to be though out. What do you feel on this approach?
> 
> And should we perhaps move this discussion only to linux-leds mailing list for successive replies :) ? So we don't generate too broad traffic.
> 

Thank you for this.  I have posted updated documentation and posted updated code that includes a test file that does
nothing but register a dummy node.  This was tested on raspberry pi 5.0-rc kernel.

Also the code is updated for the LP50xx and a HACK for Droid4.

brightness-model is still an open topic on the best way to implement this so we have not introduced the code yet.

Here is the ABI doc
http://git.ti.com/gitweb/?p=ti-analog-linux-kernel/dmurphy-analog.git;a=blob;f=Documentation/ABI/testing/sysfs-class-led-multicolor;h=45629199791285200e3775fc0b4dde1dfebb130f;hb=ce08183aa24edc0d883550339eef93fd72b4ac45

Here is the class description
http://git.ti.com/gitweb/?p=ti-analog-linux-kernel/dmurphy-analog.git;a=blob;f=Documentation/leds/leds-class-multicolor.txt;h=357f045a826aac71d65704891c18e7fb31e5cb9b;hb=refs/heads/multicolor_class


Dan

> Thanks,
> Vesa Jääskeläinen


-- 
------------------
Dan Murphy

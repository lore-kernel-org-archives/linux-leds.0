From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 7/9] dt: bindings: lp50xx: Introduce the lp50xx family
 of RGB drivers
Date: Mon, 27 May 2019 19:47:36 -0500
Message-ID: <fd075387-8b54-ed48-f480-bd673df88ac3@ti.com>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-8-dmurphy@ti.com> <20190524205022.GA9518@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190524205022.GA9518@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Rob

On 5/24/19 3:50 PM, Rob Herring wrote:
> On Thu, 23 May 2019 14:08:18 -0500, Dan Murphy wrote:
>> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024 and
>> LP5018 RGB LED device driver.  The LP5036/30/24/18 can control RGB LEDs
>> individually or as part of a control bank group.  These devices have the ability
>> to adjust the mixing control for the RGB LEDs to obtain different colors
>> independent of the overall brightness of the LED grouping.
>>
>> Datasheet:
>> http://www.ti.com/lit/ds/symlink/lp5024.pdf
>> http://www.ti.com/lit/ds/symlink/lp5036.pdf
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>   .../devicetree/bindings/leds/leds-lp50xx.txt  | 142 ++++++++++++++++++
>>   1 file changed, 142 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
>>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.

I usually provide the tags but in my cover letter I did indicate that 
these patchsets have changed pretty dramatically so I did not feel right 
about pulling in anyones tags.

Adding your reviewed by on a binding that changed did not seem right to me.

Dan

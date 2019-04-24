From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: ti-lmu: Modify dt bindings for the
 LM3697
Date: Wed, 24 Apr 2019 14:24:13 -0500
Message-ID: <fb03c31e-2050-0975-f737-dcf401c45380@ti.com>
References: <20190405142855.3969-1-dmurphy@ti.com>
 <20190405142855.3969-4-dmurphy@ti.com>
 <04e160da-a73e-d330-3df4-8f420b3612b4@gmail.com>
 <1a1482f7-a683-49d5-69a3-aa73a641288e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1a1482f7-a683-49d5-69a3-aa73a641288e@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh+dt@kernel.org
Cc: pavel@ucw.cz, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Bump for Rob

On 4/12/19 2:34 PM, Jacek Anaszewski wrote:
> And one more:
> 
> [5] - LED naming patch set v3
> 
> On 4/11/19 9:48 PM, Jacek Anaszewski wrote:
>> Hi Rob,
>>
>> I've collected references to the DT patches we're waiting
>> to be reviewed. This is just to make sure that none of them
>> will be missed - recent traffic on the linux-leds list
>> is a bit heavier.
>>
>> [0] - draft of LED multi color class - we would especially like
>>        to get a feedback on the proposed brightness-model DT design
>> [1][2] - LM3697 backlight driver rework
>> [3][4] - LM36274 backlight driver with regulator support
>>
>> On 4/5/19 4:28 PM, Dan Murphy wrote:
>>> The LM3697 is a single function LED driver. The single function LED
>>> driver needs to reside in the LED directory as a dedicated LED driver
>>> and not as a MFD device.  The device does have common brightness and ramp
>>> features and those can be accomodated by a TI LMU framework.
>>>
>>> The LM3697 dt binding needs to be moved from the ti-lmu.txt and a dedicated
>>> LED dt binding needs to be added.  The new LM3697 LED dt binding will then
>>> reside in the Documentation/devicetree/bindings/leds directory and follow the
>>> current LED and general bindings guidelines.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> [...]
>> [0] https://marc.info/?l=linux-kernel&m=155414072611538&w=2
>> [1] https://marc.info/?l=devicetree&m=155447454524411&w=2
>> [2] https://lore.kernel.org/patchwork/patch/1058762/
>> [3] https://marc.info/?l=devicetree&m=155447624324995&w=2
>> [4] https://lore.kernel.org/patchwork/patch/1058779/
>>
> 
> [5] - https://marc.info/?l=linux-kernel&m=155405492231039&w=2
> 

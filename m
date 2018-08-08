From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/2] dt: bindings: lm3697: Add bindings for lm3697
 driver
Date: Wed, 8 Aug 2018 11:52:12 +0200
Message-ID: <9908f71b-0881-8aca-9e59-009eecdb598c@gmail.com>
References: <20180807160442.8937-1-dmurphy@ti.com>
 <5b8f8622-a5a5-4c54-c1ab-334db75dce83@ysoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5b8f8622-a5a5-4c54-c1ab-334db75dce83@ysoft.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>, Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Michal.

Thanks for the heads-up.
"dt-" prefix is indeed more preferred than "dt: ".

Dan - I will fix it by myself, no need to resend.

Best regards,
Jacek Anaszewski

On 08/08/2018 09:56 AM, Michal Vokáč wrote:
> On 7.8.2018 18:04, Dan Murphy wrote:
>> Add the device tree bindings for the lm3697
>> led driver for backlighting and display.
> 
> Hi Dan,
> it seems like you missed to fix part of the subject as Jacek suggested.
> 
> I think it should be: "dt-bindings: leds: Add bindings for lm3697 driver"
> 
> Best regards,
> Michal
>>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>
>> v2 - Fixed subject and patch commit message -
>> https://lore.kernel.org/patchwork/patch/971326/
> 
> 

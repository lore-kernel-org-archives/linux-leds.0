From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Date: Wed, 29 May 2019 15:47:08 -0500
Message-ID: <afd2e445-09a9-a07f-f020-ede6870dce6e@ti.com>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
 <20190523130311.GA17245@sirena.org.uk>
 <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
 <20190526124838.GH2456@sirena.org.uk>
 <2398099b-16e6-f155-5852-45ba3dbc21ef@ti.com>
 <20190529151000.GP2456@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190529151000.GP2456@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Mark

On 5/29/19 10:10 AM, Mark Brown wrote:
> On Wed, May 29, 2019 at 06:51:32AM -0500, Dan Murphy wrote:
>
>> Although I don't disagree with you I don't see how the interface is fragile
>> with only these 3 regulators defined.
>> Would it not be prudent to amend this driver if/when a new regulator is
>> needed that has a different enable bit/register combination?   And if that
> The fragility I'm worried about is someone forgetting to make suitable
> updates, especially if they don't use the feature in their own system.

If they don't define the enable GPIO in the device tree then the gpio 
descriptor pointer is NULL and the register write does not occur.

The documentation indicates that this is only applicable for 3632 I need 
to add the LM36274.

>> was the case I would almost expect a different driver completely if the
>> regmap did not line up correctly.  I only reused this driver because the
>> registers and bits lined up and did not think it was necessary to create a
>> whole new driver.
> This is a single register bit which is set once on startup isn't it?  It
> seems like exactly the sort of thing that a hardware designer might
> change incompatibly, perhaps even for good reasons like adding more
> flexibility over which pins can be used to control the enable and far
> from something that would require a totally new driver if it was handled
> differently.

Currently I don't have a device in this family that requires this level 
of flexibility for this pin or configuration.

So if a need should arise should we not implement that flexibility at 
that point?

Not only this but the gpio descriptor is protected in 
lm363x_regulator_of_get_enable_gpio due to checking of the regulator 
ID.  As in patch #4 of this series if LM3632 or LM36274 check for enable 
definition in the DT and create the descriptor if found.  If it is any 
other regulator then don't do anything.

If the HW designer changes these bits we end up with a new part and then 
at that point we could add code to redefine the bit mask as well.

Dan

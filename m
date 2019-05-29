From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RESEND PATCH v4 1/6] regulator: lm363x: Make the gpio register
 enable flexible
Date: Wed, 29 May 2019 06:51:32 -0500
Message-ID: <2398099b-16e6-f155-5852-45ba3dbc21ef@ti.com>
References: <20190522192733.13422-1-dmurphy@ti.com>
 <20190522192733.13422-2-dmurphy@ti.com>
 <20190523130311.GA17245@sirena.org.uk>
 <d4673abc-442c-83eb-1830-7f7ed9d8419e@ti.com>
 <20190526124838.GH2456@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190526124838.GH2456@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, lgirdwood@gmail.com, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Mark

On 5/26/19 7:48 AM, Mark Brown wrote:
> On Thu, May 23, 2019 at 08:50:20AM -0500, Dan Murphy wrote:
>> On 5/23/19 8:03 AM, Mark Brown wrote:
>>> On Wed, May 22, 2019 at 02:27:28PM -0500, Dan Murphy wrote:
>>> Is it guaranteed that the bitmask for enabling the use of the GPIO is
>>> going to be the same for all regulators?  The bitmasks for the regulator
>>> enable look to be different, and it also looks like this setting might
>>> affect multiple regulators since it seems there are multiple enable bits
>>> in the same register.  If this affects multiple regulators then how's
>>> that working at the minute?
>> Yes for the 3632 and 36274 bit0 is the EXT_EN for LCM on these chips.
>> LM3631 does not have LCM GPIO control so there is no setting and this should not be called.
>> If it is then the developer implemented the DT wrong.
> This feels fragile - it works for the current users but it's just
> assuming that the placement of this bit will always be in the same
> position in the same register as the enable and will silently fail if a
> new chip variant does things differently.  Either storing the data
> separately somewhere driver specific or just having explicit switch
> statements would be more robust.


Although I don't disagree with you I don't see how the interface is 
fragile with only these 3 regulators defined.

Would it not be prudent to amend this driver if/when a new regulator is 
needed that has a different enable bit/register combination?   And if 
that was the case I would almost expect a different driver completely if 
the regmap did not line up correctly.  I only reused this driver because 
the registers and bits lined up and did not think it was necessary to 
create a whole new driver.

Dan

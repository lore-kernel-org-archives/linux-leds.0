From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 2/7] dt: bindings: Add multicolor class dt bindings
 documention
Date: Fri, 12 Apr 2019 21:10:49 +0200
Message-ID: <7a987453-0e4d-be27-790e-efa4a0f40b2b@gmail.com>
References: <20190411193848.23140-1-dmurphy@ti.com>
 <20190411193848.23140-3-dmurphy@ti.com> <20190412000707.70f8319f@nic.cz>
 <5675ac20-6db2-34ea-938a-01f0076b87e7@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5675ac20-6db2-34ea-938a-01f0076b87e7@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, Marek Behun <marek.behun@nic.cz>
Cc: robh+dt@kernel.org, pavel@ucw.cz, rdunlap@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Dan,

On 4/12/19 1:50 PM, Dan Murphy wrote:
> Marek
> 
> On 4/11/19 5:07 PM, Marek Behun wrote:
>> Hi Dan,
>> this probaly was discussed, but I did not follow brightness model
>> discussions:
>> what will happen if I set yellow by writing into yellow mode
>> brightness, and then orange by writing orange model brightness?
>> Will the resulting color be a mix of yellow and orange, or will the
>> orange overwrite the yellow setting?
>>
> 
> This was not discussed and is a good question.  If you write the yellow mode for a group of
> LEDs then yellow would be produced for the brightness requested.
> 
> If orange is then requested then orange should be displayed at the brightness level requested.
> So yes the orange will over write the yellow.

Yes, and individual color brightness levels should correspond
to the color components of the brightness-model level currently set.

> The next question is if the absolute colors are written does it produce the same behavior?
> 
> So if you have yellow and write to the red should the red LED brightness be modified or should the
> color switch to red?
> And if the red LED is on and the blue LED is written should the color switch to blue or should the blue and red LEDs be mixed together?

Now, if any of the color brightness files is altered it should update
the hardware with this new setting, but brightness-model and main
brightness level should not be changed. The thing that is missing in our
proposal is lack of the way to check if brightness-model is up to date
(i.e. if it reflects what is written to the hardware).

How about utilizing the sync file from the new colors directory?
It could return 1 on read when brightness levels of all colors
match exactly the ones assigned to the brightness model level currently
set.

> This is tricky as the user space can write the individual absolute colors and mix the LEDs to produce varying
> colors.  But the behavior writing the brightness models are different.
> 
> I would almost prefer that the user space reads the available absolute LED colors and creates the devices supported color palette and write the absolute LED colors only.  But this violates the requirements asked for.
> 
> Dan
> 
>> Marek
>>
> 

-- 
Best regards,
Jacek Anaszewski

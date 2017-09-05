From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
Date: Tue, 5 Sep 2017 21:10:49 +0200
Message-ID: <43133266-01c1-4ec7-893e-a7b0544f7720@gmail.com>
References: <20170828001711.19662-1-andrew@aj.id.au>
 <20170828001711.19662-2-andrew@aj.id.au>
 <20170831212840.ecr2p4nra52xvzrz@rob-hp-laptop>
 <1504220536.5933.32.camel@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504220536.5933.32.camel@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net, pavel@ucw.cz, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
List-Id: linux-leds@vger.kernel.org

Hi Andrew and Rob,

On 09/01/2017 01:02 AM, Andrew Jeffery wrote:
> Hi Rob,
> 
> On Thu, 2017-08-31 at 16:28 -0500, Rob Herring wrote:
>> On Mon, Aug 28, 2017 at 09:47:10AM +0930, Andrew Jeffery wrote:
>>> On Baseboard Management Controller (BMC) systems it's sometimes
>>> necessary for a LED to retain its state across a BMC reset (which is
>>> independent of the host system state). Add a devicetree property to
>>> describe this behaviour. The property would typically be used in
>>> conjunction with 'default-state = "keep"'.
>>  
>> A bit quick on the applying of this...
>>  
>> I don't understand how this works. The BMC usecase is interesting but 
>> that's fairly irrelevant to the binding. How do you know the GPIO state 
>> thru a reset?
> 
> The answer to that is a property of the system design in my opinion.
> 
>> You're doing a core reset, but not reseting the GPIO 
>> controller?
> 
> Well, in my specific case, the GPIO controller in question isn't on the SoC,
> it's off-chip behind an I2C bus. Powering off a BMC doesn't necessarily mean
> removing power from its peripherals, so in this case the their state is
> maintained.
> 
> Alternatively, and again in my specific (Aspeed) case, the on-SoC GPIO
> controller can be selectively reset with respect to the rest of the SoC, or
> individual GPIO lines can be marked as reset-tolerant. This gives the same
> capability and is what you've suggested above.
> 
>>  
>> When you use 'default-state = "keep"' but not this property? Seems like  the
>> same thing to me.
> 
> Is that not also true of retain-state-suspend?
> 
> The existing behaviour of leds-gpio was to turn the managed LEDs off in the
> remove() path. To me this was unexpected behaviour, but it is what it is. My
> first pass at the patch (before I sent it out) was to do as you suggest and
> only turn it off in the absence of 'default-state = "keep"'.  However there
> were quite a number of users of that configuration, and this could be an
> unexpected change of behaviour. Given retain-state-suspend was already defined,
> it seemed that the non-breaking way to get the behaviour I desired was to
> introduce retain-state-shutdown.
> 
> Sure, this is dealing with problems in the driver and not describing hardware,
> but at this point the behaviour is already in place and people might be relying
> on it.
> 
>> Presumably the bootloader would just distinguish  between a
>> warm and cold reset to decide whether to re-init the state.
>>  
>> Finally, if we do have this property, why is it GPIO specific. You could 
>> just as easily have a LED controller IC and want to do the same thing.
> 
> I don't think we're precluded from making it more general even if it's
> submitted as specific to leds-gpio? I don't have anything against making it
> more generic. I was tossing up about doing so, but went for the specific case
> first because we could make it more generic without problems. Going the other
> way is harder.

This explanation looks reasonable. I'll wait two more days before
sending LED 4.14 updates upstream.

It would be nice to have clear Rob's statement about this patch set -
either ack or NACK.

-- 
Best regards,
Jacek Anaszewski

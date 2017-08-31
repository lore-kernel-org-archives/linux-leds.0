From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
Date: Thu, 31 Aug 2017 16:28:40 -0500
Message-ID: <20170831212840.ecr2p4nra52xvzrz@rob-hp-laptop>
References: <20170828001711.19662-1-andrew@aj.id.au>
 <20170828001711.19662-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170828001711.19662-2-andrew@aj.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-leds@vger.kernel.org, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
List-Id: linux-leds@vger.kernel.org

On Mon, Aug 28, 2017 at 09:47:10AM +0930, Andrew Jeffery wrote:
> On Baseboard Management Controller (BMC) systems it's sometimes
> necessary for a LED to retain its state across a BMC reset (which is
> independent of the host system state). Add a devicetree property to
> describe this behaviour. The property would typically be used in
> conjunction with 'default-state = "keep"'.

A bit quick on the applying of this...

I don't understand how this works. The BMC usecase is interesting but 
that's fairly irrelevant to the binding. How do you know the GPIO state 
thru a reset? You're doing a core reset, but not reseting the GPIO 
controller?

When you use 'default-state = "keep"' but not this property? Seems like 
the same thing to me. Presumably the bootloader would just distinguish 
between a warm and cold reset to decide whether to re-init the state.

Finally, if we do have this property, why is it GPIO specific. You could 
just as easily have a LED controller IC and want to do the same thing.

Rob

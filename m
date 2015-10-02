From: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [PATCH v2 1/3] leds: add device activity LED triggers
Date: Fri, 2 Oct 2015 21:09:13 +0200
Message-ID: <20151002190913.GA2264@corsair.lan>
References: <cover.1443705827.git.maciek.borzecki@gmail.com>
 <333479ab96fc4cef3c6feec31ab75802a809e38d.1443705827.git.maciek.borzecki@gmail.com>
 <20151001144718.GQ26335@jcartwri.amer.corp.natinst.com>
 <20151002074537.GC31149@corsair.lan>
 <20151002170854.GA10631@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151002170854.GA10631@jcartwri.amer.corp.natinst.com>
Sender: linux-doc-owner@vger.kernel.org
To: Josh Cartwright <joshc@ni.com>
Cc: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
List-Id: linux-leds@vger.kernel.org

On 10/02 12:08, Josh Cartwright wrote:
<snip>
>
> Hmm, maybe we're bikeshedding at this point, but LEDs with those names
> seem much more straightfoward to me than a "dev-<maj>:<min>" name, for
> devices which have done dynamic dev_t allocation.
>
> > Also, if I'm not mistaken, using this approach the partitions on MMC
> > card or SATA drive would end up with the same trigger name, as it is a
> > single device.
>
> This would only be true if you used _just_ the struct device.  I was
> imagining that you'd specify a (struct device, unsigned index) pair.
> Better, you could do a (struct device, const char *) pair.
>
> Also, from a lifetime management perspective, it starts to feel like
> something that might integrate better as a managed resource (devm_*).
>
> [..]
> > Multiple dev nodes will already have different minor numbers, so
> > their dev_t is different anyway.
>
> Okay, backing up I don't really see what this API really buys the
> consumer.  The dev_t -> struct led_trigger mapping just seems like a
> total waste.  Why not just make your ledtrig_dev_add() function return
> the struct led_trigger * that the consumer keeps track of?
>
> Maybe seeing an example consumer would provide some clarification.
>
> > As for devices that do not have a dev_t assigned to them one can still
> > pass a custom tag in ledtrig_dev_add(). It's just a number so as long as
> > there's no collision in numbering things should be fine.
>
> Ensuring no collision will be difficult, especially given that it's most
> common that the dynamic allocator is used.  In order to guarantee no
> collisions, a user who doesn't expose any device nodes would need to do
> their own dev_t allocation...to use this interface.  And that seems
> silly to me.

Thanks, I really appreciate your feedback.

--
Maciek Borzecki

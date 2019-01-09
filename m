From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 2/5] leds: Add helper for getting default pattern from
 Device Tree
Date: Wed, 9 Jan 2019 15:03:51 +0100
Message-ID: <CAJKOXPdhz3PVELFk_zSH+akmCLWgEfWvV+aGUoL9R9sBaQKjDg@mail.gmail.com>
References: <1546596524-19863-1-git-send-email-krzk@kernel.org>
 <1546596524-19863-3-git-send-email-krzk@kernel.org> <20190107174924.GD933@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107174924.GD933@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, 7 Jan 2019 at 18:49, Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > Multiple LED triggers might need to access default pattern so add a
> > helper for that.
> >
> >  }
> >  EXPORT_SYMBOL_GPL(led_update_brightness);
> >
> > +u32 *led_get_default_pattern(struct led_classdev *led_cdev, unsigned int *size)
> > +{
> > +     struct device_node *np = dev_of_node(led_cdev->dev);
> > +     u32 *pattern;
> > +     int count;
> > +
> > +     if (!np)
> > +             return NULL;
> > +
> > +     count = of_property_count_u32_elems(np, "led-pattern");
> > +     if (count < 0)
> > +             return NULL;
> > +
> > +     pattern = kcalloc(count, sizeof(*pattern), GFP_KERNEL);
> > +     if (!pattern)
> > +             return NULL;
> > +
> > +     if (of_property_read_u32_array(np, "led-pattern", pattern, count))
> > +             goto err;
>
> Just kfree and return here. No need for goto if that is just one case.

OK

>
>
> >  /**
> > + * led_get_default_pattern - return default pattern
> > + *
> > + * @led_cdev: the LED to get default pattern for
> > + * @size:     pointer for storing the number of elements in returned array,
> > + *            modified only if return != NULL
> > + *
> > + * Return:    Allocated array of integers with default pattern from DeviceTree
> > + *            or NULL.  Caller is responsible for kfree().
> > + */
>
> "DeviceTree" -> "device tree".

Sure, thanks for the feedback!

Best regards,
Krzysztof

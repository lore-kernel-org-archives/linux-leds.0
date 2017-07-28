From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC 04/19] dt: bindings: Add lens-focus binding for image
 sensors
Date: Fri, 28 Jul 2017 14:45:11 +0200
Message-ID: <20170728124509.GB10543@localhost>
References: <20170718190401.14797-1-sakari.ailus@linux.intel.com>
 <20170718190401.14797-5-sakari.ailus@linux.intel.com>
 <dcd84739-7e83-e07f-9290-a066013af102@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dcd84739-7e83-e07f-9290-a066013af102@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-leds@vger.kernel.org, laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
List-Id: linux-leds@vger.kernel.org

Hi!

> Is the lens-focus phandle specific to voice-coil controllers? What about
> motor-controlled focus systems? What when there are multiple motors? E.g.
> one for the focus, one for the iris control (yes, we have that).

I'd say motor vs. coil is not important. Iris control should go to
lens-iris: or something.

> What if you have two sensors (stereoscopic) controlled by one motor?

Are there such systems? I'd say lets solve it if we see it...

> >  - flash: phandle referring to the flash driver chip. A flash driver may
> >    have multiple flashes connected to it.
> >  
> > +- lens-focus: A phandle to the node of the focus lens controller.
> > +
> >  

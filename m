From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: as3645a flash userland interface
Date: Tue, 12 Sep 2017 15:04:47 +0300
Message-ID: <20170912120447.yqdwbdfgd7ac4xpn@valkosipuli.retiisi.org.uk>
References: <20170912084236.1154-1-sakari.ailus@linux.intel.com>
 <20170912084236.1154-25-sakari.ailus@linux.intel.com>
 <20170912103628.GB27117@amd>
 <20170912104720.ifyouc5pa5et6gzk@valkosipuli.retiisi.org.uk>
 <20170912114051.GA1655@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170912114051.GA1655@amd>
Sender: linux-media-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, niklas.soderlund@ragnatech.se, robh@kernel.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, sre@kernel.org
List-Id: linux-leds@vger.kernel.org

Ahoy!

On Tue, Sep 12, 2017 at 01:40:51PM +0200, Pavel Machek wrote:
> Hi!
> 
> > On Tue, Sep 12, 2017 at 12:36:28PM +0200, Pavel Machek wrote:
> > > Hi!
> > > 
> > > There were some changes to as3645a flash controller. Before we have
> > > stable interface we have to keep forever I want to ask:
> > > 
> > > What directory are the flash controls in?
> > > 
> > > /sys/class/leds/led-controller:flash ?
> > > 
> > > Could we arrange for something less generic, like
> > > 
> > > /sys/class/leds/main-camera:flash ?
> > > 
> > > Thanks,
> > 
> > The LEDs are called as3645a:flash and as3645a:indicator currently, based on
> > the name of the LED controller's device node. There are no patches related
> > to this set though; these have already been merged.
> > 
> > The label should be a "human readable string describing the device" (from
> > ePAPR, please excuse me for not having a newer spec), and the led common
> > bindings define it as:
> > 
> > - label : The label for this LED. If omitted, the label is taken from the node
> >           name (excluding the unit address). It has to uniquely identify
> >           a device, i.e. no other LED class device can be assigned the same
> >           label.
> 
> Ok, can we set the label to "main_camera" for N9 and n950 cases?
> 
> "as3645a:flash" is really wrong name for a LED. Information that
> as3645 is already present elsewhere in /sys. Information where the LED
> is and what it does is not.
> 
> I'd like to have torch application that just writes
> /sys/class/leds/main_camera:white:flash/brightness . It should not
> need to know hardware details of differnet phones.

Hmm. There don't seem to be a uniform way to form labels.

What I'd do is to look up a LED that implements LED flash class and use
that; it's a flash LED and is likely to be the most powerful in the system.
There could be several as well, some more recent flash controllers have
more than one.

I wonder what Jacek thinks.

> 
> > I don't think that you should be looking to use this to associate it with
> > the camera as such. The association information with the sensor is
> > available to the kernel but there's no interface that could meaningfully
> > expose it to the user right now.
> 
> Yeah, I'm not looking for sensor association. I'm looking for
> reasonable userland interface.

Ack. Hopefully we can provide the association some day, too...

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi

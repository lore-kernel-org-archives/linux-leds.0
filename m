From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH w/ acks] DT: leds: Add flash LED devices related
 properties
Date: Mon, 22 Dec 2014 12:45:32 +0100
Message-ID: <20141222114532.GA20321@amd>
References: <20141120131713.GC27527@amd>
 <20141203185746.GA25267@amd>
 <CAL_Jsq+RQvjrvkS7JWPyUmJ4jA7n637xRwM4y4ZWYyGKoetnHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+RQvjrvkS7JWPyUmJ4jA7n637xRwM4y4ZWYyGKoetnHA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, sakari.ailus@iki.fi, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-leds@vger.kernel.org, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>
List-Id: linux-leds@vger.kernel.org

On Sun 2014-12-21 20:27:46, Rob Herring wrote:
> On Wed, Dec 3, 2014 at 12:57 PM, Pavel Machek <pavel@ucw.cz> wrote:
> >
> > Addition of a LED Flash class extension entails the need for flash LED
> > specific device tree properties. The properties being added are:
> > max-microamp, flash-max-microamp, flash-timeout-microsec.
> >
> > Signed-off-by: Pavel Machek <pavel@ucw.cz>
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> 
> One minor comment, otherwise:
> 
> Acked-by: Rob Herring <robh@kernel.org>


Thanks, I sent and updated version.

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

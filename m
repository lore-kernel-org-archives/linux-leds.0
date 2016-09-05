From: Anders Darander <anders-7UjN0b3lYz2SbKU13Z4Etw@public.gmane.org>
Subject: Re: [PATCH] leds-pca963x: add bindings to invert polarity
Date: Mon, 5 Sep 2016 13:02:10 +0200
Message-ID: <20160905110210.bxno7zx7exmtu774@ad.chargestorm.se>
References: <1462182104-21450-1-git-send-email-anders@chargestorm.se>
 <5729A4AB.5080901@samsung.com>
 <20160504075508.GA22125@ad.chargestorm.se>
 <5729AE59.6000009@schinagl.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5729AE59.6000009-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi,

* Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org> [160504 10:10]:
> On 04-05-16 09:55, Anders Darander wrote:
> > * Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> [160504 09:28]:
> > > Please note that there has already been an attempt to add
> > > the support for inverted output polarity to this driver and related
> > > discussion [1]. This thread remains quiet for around two weeks.
> > Ah, nice coincidence! Unfortunately, I made the work earlier than his
> > posting, otherwise I could have spent the time on somethinge else. ;)
> Sorry to be so slacking with submitting this, I've been sitting on it for 6
> months now :) I just kept postponing in submitting it. But as they say,
> great minds, and all that.

> > Well, then I hope v2 of his patches comes along.

Any news on a v2?

Otherwise, could we agree on a dt binding for the inverted output, and
look into merging that prior to the rest of the series? I'd like to get
rid of my local patch... 

Cheers,
Anders
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

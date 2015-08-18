From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: leds-gpio on x86
Date: Tue, 18 Aug 2015 12:02:16 +0300
Message-ID: <20150818090216.GG1552@lahna.fi.intel.com>
References: <20150806173558.GZ1540@lahna.fi.intel.com>
 <20150806201820.5ca0764d@x2>
 <20150807105745.GB1540@lahna.fi.intel.com>
 <20150808140656.6b81d3b9@x2>
 <20150811120038.GF1541@lahna.fi.intel.com>
 <20150811194256.08816c63@x2>
 <20150812125314.GS1541@lahna.fi.intel.com>
 <20150815123640.45a5b9bf@x2>
 <20150817230823.61de477a@x2>
 <20150818093226.3db0b553@x2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:6862 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751465AbbHRJCT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 18 Aug 2015 05:02:19 -0400
Content-Disposition: inline
In-Reply-To: <20150818093226.3db0b553@x2>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vincent Pelletier <plr.vincent@gmail.com>
Cc: linux-leds@vger.kernel.org

On Tue, Aug 18, 2015 at 09:32:26AM +0200, Vincent Pelletier wrote:
> On Mon, 17 Aug 2015 23:08:23 +0200, Vincent Pelletier
> <plr.vincent@gmail.com> wrote:
> > How can I debug this further ?
> 
> I made a bit of progress: disabling all but one cpu (...which, in this
> case, just means disabling the second core) makes the error messages go
> away, and blinking works fine.
> 
> There is a lock taken in __request_region, and released around
> schedule() when muxed. I guess this means region request is just pushed
> into a queue when resource is busy, then scheduler is told to let
> whatever else available run.
> I have no idea if the lock should be taken before or after
> remove_wait_queue after schedule call.

For each GPIO operation the f7188x driver calls
superio_enter()/superio_exit().

However, I don't think that is enough to prevent multiple threads
accessing a GPIO at the same time.

One option is to add mutex to the private structure and then do
something like this in each callback:

static int f7188x_gpio_get(...)
{
	mutex_lock(&sio->lock);
	
	/* request the resource and touch the hardware */

	mutex_unlock(&sio->lock);

	...
}

It is a bit weird that it needs to acquire/release the ioport region each
time.

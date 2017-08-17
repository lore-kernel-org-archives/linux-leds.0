From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3.2 2/3] v4l2-flash-led-class: Create separate
 sub-devices for indicators
Date: Thu, 17 Aug 2017 11:13:10 -0700
Message-ID: <20170817181310.GA4227@kroah.com>
References: <20170810154947.2283-3-sakari.ailus@linux.intel.com>
 <20170815112811.17212-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20170815112811.17212-1-sakari.ailus@linux.intel.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: devel@driverdev.osuosl.org, laurent.pinchart@ideasonboard.com, viresh.kumar@linaro.org, Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-media@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, Aug 15, 2017 at 02:28:11PM +0300, Sakari Ailus wrote:
> The V4L2 flash interface allows controlling multiple LEDs through a single
> sub-devices if, and only if, these LEDs are of different types. This
> approach scales badly for flash controllers that drive multiple flash LEDs
> or for LED specific associations. Essentially, the original assumption of a
> LED driver chip that drives a single flash LED and an indicator LED is no
> longer valid.
> 
> Address the matter by registering one sub-device per LED.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com> (for greybus/light)
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
> since v3.2:

"3.2"?

Isn't that just "v5"?  Please don't be cute with version numbering, we
have a hard time telling what is going on, make it obvious...

thanks,

greg k-h

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 1/3] staging: greybus: light: fix memory leak in v4l2
 register
Date: Thu, 17 Aug 2017 11:14:57 -0700
Message-ID: <20170817181457.GA8740@kroah.com>
References: <20170810154947.2283-1-sakari.ailus@linux.intel.com>
 <20170810154947.2283-2-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20170810154947.2283-2-sakari.ailus@linux.intel.com>
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

On Thu, Aug 10, 2017 at 06:49:45PM +0300, Sakari Ailus wrote:
> From: Rui Miguel Silva <rmfrfs@gmail.com>
> 
> We are allocating memory for the v4l2 flash configuration structure and
> leak it in the normal path. Just use the stack for this as we do not
> use it outside of this function.
> 
> Also use IS_ERR() instead of IS_ERR_OR_NULL() to check return value from
> v4l2_flash_init() for it never returns NULL.
> 
> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> ---
>  drivers/staging/greybus/light.c | 29 +++++++++--------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)

Does not apply to my tree :(

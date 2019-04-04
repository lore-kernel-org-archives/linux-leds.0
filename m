From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/5] leds: TI LMU: Add common code for TI LMU devices
Date: Thu, 4 Apr 2019 15:22:30 +0200
Message-ID: <20190404132230.GB6190@xo-6d-61-c0.localdomain>
References: <20190325142403.30447-1-dmurphy@ti.com>
 <20190325142403.30447-3-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190325142403.30447-3-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon 2019-03-25 09:24:00, Dan Murphy wrote:
> Create a TI LMU common framework for TI LMU devices that share
> common features.
> 
> Currently the runtime ramp and brightness setting have
> been identified as common features with common register settings.
> 
> This work is derived from Milo Kims TI LMU MFD code.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/8] dt: bindings: Add a binding for flash devices
 associated to a sensor
Date: Wed, 14 Jun 2017 10:19:47 -0500
Message-ID: <20170614151947.tut34pudzqw4soay@rob-hp-laptop>
References: <1497433639-13101-1-git-send-email-sakari.ailus@linux.intel.com>
 <1497433639-13101-2-git-send-email-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:35136 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752528AbdFNPTt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Jun 2017 11:19:49 -0400
Content-Disposition: inline
In-Reply-To: <1497433639-13101-2-git-send-email-sakari.ailus@linux.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, sebastian.reichel@collabora.co.uk, pavel@ucw.cz

On Wed, Jun 14, 2017 at 12:47:12PM +0300, Sakari Ailus wrote:
> Camera flash drivers (and LEDs) are separate from the sensor devices in
> DT. In order to make an association between the two, provide the
> association information to the software.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

From: Marek Behun <marek.behun@nic.cz>
Subject: Re: [RFC PATCH 2/5] dt: bindings: Add multicolor class dt bindings
 documention
Date: Tue, 2 Apr 2019 18:17:12 +0200
Message-ID: <20190402181712.3eccdb4b@nic.cz>
References: <20190401173400.14238-1-dmurphy@ti.com>
        <20190401173400.14238-3-dmurphy@ti.com>
        <20190401212921.GB14681@amd>
        <f8655180-0c3a-7292-3a49-57d997473992@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f8655180-0c3a-7292-3a49-57d997473992@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Pavel Machek <pavel@ucw.cz>, robh+dt@kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, 2 Apr 2019 06:40:53 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> I have had off line conversations with Jacek about this brightness model node.
> 
> Your concern was actually one of my concerns as well.  Not only millions of entries but also having a huge
> DT binary.
> 
> We wanted to RFC this to get feedback.  And this is why I have not added any support for this in the framework code.
> 
> Dan
> 

What if we just stuck to color spaces and defined channel curves in the
device tree?

The curve could then be defined via an array of integer pairs, which
would be interpreted as points via which the curve passes and the curve
would be approximated by linear segemts...

  led@0 {
    colorspace = <COLOR_SPACE_ID_RGB>;
    red-curve = <0 0>, <255 255>;
    green-curve = <0 0>, <255 128>;
    blue-curve = <0 0>, <255 128>;
  };

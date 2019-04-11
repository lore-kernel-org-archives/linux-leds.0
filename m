From: Marek Behun <marek.behun@nic.cz>
Subject: Re: [PATCH v2 2/7] dt: bindings: Add multicolor class dt bindings
 documention
Date: Fri, 12 Apr 2019 00:07:07 +0200
Message-ID: <20190412000707.70f8319f@nic.cz>
References: <20190411193848.23140-1-dmurphy@ti.com>
        <20190411193848.23140-3-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190411193848.23140-3-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz, rdunlap@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Dan,
this probaly was discussed, but I did not follow brightness model
discussions:
what will happen if I set yellow by writing into yellow mode
brightness, and then orange by writing orange model brightness?
Will the resulting color be a mix of yellow and orange, or will the
orange overwrite the yellow setting?

Marek

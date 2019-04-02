From: Marek Behun <marek.behun@nic.cz>
Subject: Re: [RFC PATCH 3/5] documention: leds: Add multicolor class
 documentation
Date: Tue, 2 Apr 2019 07:55:51 +0200
Message-ID: <20190402075551.03e296f3@nic.cz>
References: <20190401173400.14238-1-dmurphy@ti.com>
        <20190401173400.14238-4-dmurphy@ti.com>
        <20190401212709.GA14681@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401212709.GA14681@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, 1 Apr 2019 23:27:10 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> One was discussed before -- have single file which contains
> coefficients for r/g/b channels.

That would somehow break the rule one file/one value. Although you
could consider the whole color one value, that way it would not be
broken...

From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH V3] leds: pca955x: Add ACPI support for pca955x
Date: Wed, 30 Nov 2016 12:01:45 +0200
Message-ID: <20161130100145.GF1459@lahna.fi.intel.com>
References: <1480475311-14385-1-git-send-email-tnhuynh@apm.com>
 <302ebc57-6f52-b0ff-e354-0c67556a88ed@samsung.com>
 <7efcf021-72c9-328a-ad88-4c226e8b5d6d@samsung.com>
 <CANQ9TuAc8S-Q2Wx_qkJLLMd8dH7XDiGchB7EesPW1is9oFqWhA@mail.gmail.com>
 <c1d0e813-9e1e-b387-735a-2c8f39c5308e@samsung.com>
 <dc989a8b92342d2ceb63381ae9dc019d@mail.gmail.com>
 <10443ff4-67ff-d474-401f-21fa7f33a9a5@samsung.com>
 <328afec669295cbc3a4338a4347e7067@mail.gmail.com>
 <959f287f-74c1-d790-4f36-9c7ac053bc8e@axentia.se>
 <d1751969-3c8f-d4c0-8e99-74b9dd26bd98@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d1751969-3c8f-d4c0-8e99-74b9dd26bd98@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Peter Rosin <peda@axentia.se>, Phong Vo <pvo@apm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Loc Ho <lho@apm.com>, Thang Nguyen <tqnguyen@apm.com>, patches <patches@apm.com>, Tin Huynh <tnhuynh@apm.com>
List-Id: linux-leds@vger.kernel.org

On Wed, Nov 30, 2016 at 10:58:33AM +0100, Jacek Anaszewski wrote:
> It certainly downgrades code readability, but in case there is
> similar surrounding code there are two options to keep the things
> consistent - either stick to the current style or change it.
> IMHO the latter would generate only unnecessary noise in this
> particular case.

Also that's the style we have been using when adding ACPI support to
drivers.

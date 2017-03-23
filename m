From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v1 1/2] Revert "i2c: mux: pca954x: Add ACPI support for
 pca954x"
Date: Thu, 23 Mar 2017 08:45:58 +0100
Message-ID: <7d5fba14-d3f1-dfaa-ac7d-5001ccf370a1@axentia.se>
References: <20170321191310.32957-1-andriy.shevchenko@linux.intel.com>
 <01b7c79e-c52f-8e87-59a8-2eb17a72d733@axentia.se>
 <1490187942.19767.161.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1490187942.19767.161.camel@linux.intel.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc: Tin Huynh <tnhuynh@apm.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 2017-03-22 14:05, Andy Shevchenko wrote:
> On Wed, 2017-03-22 at 11:23 +0100, Peter Rosin wrote:
>> On 2017-03-21 20:13, Andy Shevchenko wrote:
>>> In ACPI world any ID should be carefully chosen and registered
>>> officially. The commit bbf9d262a147 seems did a wrong assumption
>>> because
>>> PCA is the registered PNP ID for "PHILIPS BU ADD ON CARD". I'm
>>> pretty
>>> sure this prefix has nothing to do with the driver in question.
>>
>> [Cc: leds people, in case they know any details]
>>
>> Hmmm, a couple of questions about that "pretty sure"...
> 
> I didn't neither see the *real* excerpt from DSDT nor hear anything
> about official IDs from Phillips.
> 
>> Philips and NXP are pretty much just different faces of the same coin,
>> IIUC.
> 
> Good to know.
> 
> While I might be mistaken, I would like to remove a confusion until we
> get an official confirmation either in *real* existing product on the
> market or letter from Phillips representatives (see above).

Right, I don't disagree with the revert at all. The IDs were
apparently just grabbed and, as you point out, that is not the ACPI
way.

One more question though, the revert (patch 1/2) should probably be
queued up for current (4.11) and sent to stable as well (4.10 is the
only version affected), but what about patch 2/2? Is that 4.12
material or should it too be "rushed"? I feel a bit like I have
been thrown in at the deep end, and could use some guidance...

*snip*

> Thanks for input to this topic. As I said above I might be mistaken too,
> though we can't just wilfully invent ACPI IDs without vendors' approvals
> / confirmations.

Yes, I (now) fully understand that the ACPI namespace is not in our
hands.

*snip*

Cheers,
peda

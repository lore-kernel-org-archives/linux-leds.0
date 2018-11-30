From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 0/6] Introduce audio-mute LED trigger (and
 conversions to it)
Date: Fri, 30 Nov 2018 12:42:34 +0200
Message-ID: <20181130104234.GJ10650@smile.fi.intel.com>
References: <20181127084418.GA20504@amd> <20181128111806.cb3cncpjeq73sptg@pali>
 <s5hy39dv3dg.wl-tiwai@suse.de> <20181128122505.GA1193@amd>
 <8bb45cc6-9f98-9fed-9676-7f1429328c4a@gmail.com>
 <20181128203410.GA20670@amd> <20181128204612.l3bayhop4qmep2hj@pali>
 <0ed37870-c7b6-fd6b-2f6e-7325fdde3629@gmail.com>
 <20181128212212.GE20670@amd>
 <5f8eece3-95af-7866-d7d0-02cc3cb695ca@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <5f8eece3-95af-7866-d7d0-02cc3cb695ca@gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: alsa-devel@alsa-project.org, Ayman Bagabas <ayman.bagabas@gmail.com>, Takashi Iwai <tiwai@suse.de>, platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, Pavel Machek <pavel@ucw.cz>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Nov 29, 2018 at 10:23:31PM +0100, Jacek Anaszewski wrote:

> Regarding sound devices - how would we name micmute LED for USB
> microphone? I suppose that it is possible to discover some unique
> identifier in runtime - this is a question to ALSA people.

USB path (e.g. 2-1.1.2.4.3) + '::' + name ?

-- 
With Best Regards,
Andy Shevchenko
